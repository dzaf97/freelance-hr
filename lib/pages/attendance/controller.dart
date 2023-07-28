import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:myezhr/models/attendance/attendance.dart';
import 'package:myezhr/models/attendance/attendance_correction.dart';
import 'package:myezhr/models/attendance/request.dart';
import 'package:myezhr/models/shift/shift.dart';
import 'package:myezhr/models/shift/shift_daily.dart';
import 'package:myezhr/models/user/user.dart';
import 'package:myezhr/pages/attendance/record_form/attendance_location.dart'
    as attendance_location;
import 'package:myezhr/pages/attendance/record_form/attendance_review.dart';
import 'package:myezhr/pages/home_layout/home/controller.dart';
import 'package:myezhr/pages/shared/camera_page.dart';
import 'package:myezhr/repositories/attendance_repo.dart';
import 'package:myezhr/repositories/shift_repo.dart';
import 'package:myezhr/utils/camera.dart';
import 'package:myezhr/utils/formatter.dart';
import 'package:myezhr/utils/location.dart';
import 'package:myezhr/utils/storage.dart';
import 'package:myezhr/utils/theme.dart';
import 'package:myezhr/widgets/dropdown_form.dart';

class AttendanceController extends GetxController {
  // Dependency Injected
  final attendanceRepo = AttendanceRepo();
  final shiftRepo = ShiftRepo();
  final location = Get.put(Location());
  final camera = Get.put(Camera());
  var mapController = MapController();
  String fromPage = "";

  // Form variable
  var selectedShift = DropdownValue(name: "", value: 0).obs;
  var shifts = <DropdownValue>[];
  var reason = TextEditingController();
  var date = DateTime.now().obs;
  var timeIn = const TimeOfDay(hour: 8, minute: 0).obs;
  var timeOut = const TimeOfDay(hour: 18, minute: 0).obs;
  var userId = "";
  var hideButton = false.obs;

  // UI variable
  var isLoading = true.obs;
  var selectedTab = 0.obs;
  var attendanceRecords = <AttendanceRecord>[].obs;
  var attendanceCorrections = <AttendanceCorrection>[].obs;
  var radiusSet = 100.0.obs;
  var currentLocation = LatLng(3.1569, 101.7123).obs;
  var officeLocation = LatLng(3.1569, 101.7123).obs;
  var accuracy = 0.0.obs;
  var recordTimeIn = DateTime.now().obs;
  var shiftDailyId = 0.obs;
  var picture = Uint8List(0).obs;
  var markers = RxList<Marker>();
  var todayShift = "-".obs;
  var today = dateFormat.format(DateTime.now()).obs;
  var name = "-".obs;
  var designation = " | ".obs;

  @override
  void onInit() async {
    fromPage = Get.previousRoute;
    await setup();
    if (Get.currentRoute == attendance_location.AttendanceLocation.route) {
      if (location.permission == LocationPermission.always) {
        await setLocation();
      } else if (location.permission == LocationPermission.whileInUse) {
        await setLocation();
      } else {
        log("From home", name: "Attendance");
        await location.askPermission();
        await setLocation();
      }
    }
    super.onInit();
  }

  Future<void> setLocation() async {
    log("Init set location", name: "Attendance");
    var position = await location.getCurrentPosition();
    log("Current LatLng: ${position.latitude}, ${position.longitude}",
        name: "Attendance");
    currentLocation.value.latitude = position.latitude;
    currentLocation.value.longitude = position.longitude;
    accuracy.value = position.accuracy;
    markers.add(
      Marker(
        point: currentLocation.value,
        builder: (context) => Icon(
          Icons.location_on,
          size: 40,
          color: AppColor.primary,
        ),
      ),
    );

    if (Get.currentRoute == attendance_location.AttendanceLocation.route) {
      mapController.move(LatLng(position.latitude, position.longitude), 15);
    }
  }

  Future<void> setup() async {
    // User job details
    User userData = Get.find<Storage>().getUser;
    userId = userData.id.toString();
    designation.value =
        "${userData.userPosition?.name ?? "-"} | ${userData.userPosition?.description ?? "-"}";
    name.value = userData.name ?? "-";

    log(jsonEncode(userData.workLocation));

    if (userData.workLocation != null) {
      if (userData.workLocation!.radius != null) {
        radiusSet.value = userData.workLocation!.radius! * 1000;
      }
      if (userData.workLocation!.coordinate != null) {
        List<double> latLng = userData.workLocation!.coordinate!
            .split(", ")
            .map((e) => double.parse(e))
            .toList();
        officeLocation.value.latitude = latLng[0];
        officeLocation.value.longitude = latLng[1];
      }

      // Add office location marker
      markers.add(
        Marker(
          point: officeLocation.value,
          builder: (context) => Icon(
            Icons.location_city,
            size: 40,
            color: AppColor.primary,
          ),
        ),
      );
    }

    await initAttendance();
    await initAttendanceCorrection();
    isLoading(false);

    // Today attendance
    Shift? shiftData = Get.find<Storage>().getShift;
    if (shiftData == null) {
      isLoading(false);
      return;
    }
    shiftDailyId.value = shiftData.shiftDailyId ?? 0;

    todayShift.value =
        "Shift: ${shiftData.shiftDaily?.startTime?.substring(0, 5) ?? "--|--"} - ${shiftData.shiftDaily?.endTime?.substring(0, 5) ?? "--|--"}";
    isLoading(false);
  }

  // Map data to UI
  Future<void> initAttendance() async {
    List<Attendance> attendances = await attendanceRepo.getAttendance();

    if (attendances.isNotEmpty) {
      // hideButton.value = attendances.first.endTime != null ? true : false;
      log("Prev route: ${Get.previousRoute}");
      if (Get.previousRoute != "/home") {
        if (dateOnlyFormat
                .format(attendances.first.startTime ?? DateTime.now()) ==
            dateOnlyFormat.format(DateTime.now())) {
          Get.find<Storage>().setShiftType = "out";
        } else {
          Get.find<Storage>().setShiftType = "in";
        }
      }

      attendanceRecords.value = attendances
          .where((element) => element != null)
          .map(
            (e) => AttendanceRecord(
              startTime: (e.startTime != null)
                  ? timeFormat.format(e.startTime!)
                  : "--:--",
              date: (e.startTime != null)
                  ? dayDateFormat.format(e.startTime!)
                  : "-",
              endTime:
                  (e.endTime != null) ? timeFormat.format(e.endTime!) : "--:--",
              attachmentIn:
                  (e.attachmentPathIn == "") ? "-" : e.attachmentPathIn ?? "-",
              attachmentOut: (e.attachmentPathOut == "")
                  ? "-"
                  : e.attachmentPathOut ?? "-",
            ),
          )
          .toList();
    }
  }

  Future<void> initAttendanceCorrection() async {
    List<AttendanceCorrection> corrections =
        await attendanceRepo.getAttendanceCorrection();

    List<ShiftDaily> _shifts = await shiftRepo.getShiftDaily();
    if (corrections.isNotEmpty) attendanceCorrections.value = corrections;

    if (_shifts.isNotEmpty) {
      shifts = _shifts
          .map((e) => DropdownValue(name: e.shiftName, value: e.id))
          .toList();
      selectedShift.value = shifts[0];
    }
  }

  // Navigation
  void goToCamera() {
    log("Office LatLng: ${officeLocation.value.toString()}", name: "Location");
    // LatLng fake = LatLng(1.128739, 2.893473);
    bool withinRadius = location.checkRadius(
        currentLocation.value, officeLocation.value, radiusSet.value);

    // withinRadius = true;
    if (withinRadius) {
      Get.toNamed(
        CameraPage.route,
        arguments: AttendanceReview.route,
      );
    } else {
      Get.showSnackbar(
        const GetSnackBar(
          duration: Duration(seconds: 2),
          message: "You are not within office radius!",
          margin: EdgeInsets.symmetric(horizontal: 10),
        ),
      );
    }
  }

  // Send network request
  void recordAttendance(AttendanceRequest request) async {
    log(jsonEncode(request));
    AttendanceRes? response;
    if (request.startTime != null) {
      response = await attendanceRepo.postAttendance(request);
    } else {
      response = await attendanceRepo.updateAttendance(
          request, Get.find<Storage>().getClockInId);
    }
    if (response.success) {
      Get.showSnackbar(
        GetSnackBar(
          duration: const Duration(seconds: 2),
          message: response.message[0]!,
          margin: const EdgeInsets.symmetric(horizontal: 10),
        ),
      );
      Get.offAndToNamed(fromPage);
      Get.replace(HomeController());
    } else {
      Get.showSnackbar(
        GetSnackBar(
          duration: const Duration(seconds: 2),
          message: response.message[0]!,
          margin: const EdgeInsets.symmetric(horizontal: 10),
        ),
      );
    }
  }

  void submitForm(AttendanceCorrectionRequest request) async {
    EasyLoading.show();
    log("Attendance Correction request :: ${request.toJson()}",
        name: "Attendance");
    AttendanceCorrectionRes response =
        await attendanceRepo.postAttendanceCorrection(request);
    EasyLoading.dismiss();
    if (response.success) {
      Get.back();
      Get.showSnackbar(
        GetSnackBar(
          message: response.message[0]!,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          onTap: (snack) => Get.back(),
        ),
      );
      await initAttendanceCorrection();
    } else {
      Get.showSnackbar(
        GetSnackBar(
          message: response.message[0]!,
          margin: const EdgeInsets.symmetric(horizontal: 10),
        ),
      );
    }
  }
}

/*  
-  UI Model
*/

class AttendanceRecord {
  AttendanceRecord({
    required this.startTime,
    required this.date,
    required this.endTime,
    required this.attachmentIn,
    required this.attachmentOut,
  });

  final String date;
  final String startTime;
  final String endTime;
  final String attachmentIn;
  final String attachmentOut;
}

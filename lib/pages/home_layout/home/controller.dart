import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:myezhr/models/attendance/attendance.dart';
import 'package:myezhr/models/shift/shift.dart';
import 'package:myezhr/models/user/user.dart';
import 'package:myezhr/pages/attendance/record_form/attendance_location.dart'
    as attendance_location;
import 'package:myezhr/repositories/attendance_repo.dart';
import 'package:myezhr/repositories/shift_repo.dart';
import 'package:myezhr/utils/formatter.dart';
import 'package:myezhr/utils/network.dart';
import 'package:myezhr/utils/storage.dart';

class HomeController extends GetxController {
  // Dependency Injected
  final ShiftRepo shiftRepo = ShiftRepo();
  final AttendanceRepo attendanceRepo = AttendanceRepo();

  // UI variable
  var name = "-".obs;
  var profileImg = "".obs;
  var shift = "Shift 00:00 - 00:00".obs;
  var isTodayAttendance = true.obs;
  var location = "".obs;
  var selectedTab = 0.obs;
  var todayAttendanceId = "".obs;
  var startTime = "--|--".obs;
  var endTime = "--|--".obs;
  var attachmentIn = "-".obs;
  var attachmentOut = "-".obs;

  var incompleteId = "".obs;
  var incompleteStartTime = "--|--".obs;
  var incompleteEndTime = "--|--".obs;
  var incompleteAttachmentIn = "-".obs;
  var incompleteAttachmentOut = "-".obs;
  // var recordAttendanceText = "Clock in".obs;
  var recordAttendanceText = "Clock my attendance".obs;
  var hideButton = false.obs;

  @override
  void onInit() async {
    initUserSchedule();
    await initTodayShift();
    await initTodayAttendance();
    await initIncompleteAttendance();
    super.onInit();
  }

  initUserSchedule() {
    User userData = Get.find<Storage>().getUser;
    name.value = userData.name ?? "-";
    log(jsonEncode(userData));
    if (userData.photoUrl != null) {
      profileImg.value = cloudPath + userData.photoUrl;
    }
    if (userData.workLocation != null) {
      location.value = (userData.workLocation!.name != null
          ? userData.workLocation!.name!
          : "-");
    }
  }

  initTodayShift() async {
    String today = dateOnlyFormat.format(DateTime.now());
    Shift? myShift = await shiftRepo.getShiftSchedule(today);
    if (myShift == null) {
      return;
    }
    if (myShift.shiftDaily == null) {
      return;
    }
    isTodayAttendance(true);
    shift.value =
        "Shift ${myShift.shiftDaily!.startTime?.substring(0, 5) ?? "--|--"} - ${myShift.shiftDaily!.endTime?.substring(0, 5) ?? "--|--"}";
  }

  initTodayAttendance() async {
    var todayAttendance =
        await attendanceRepo.getAttendance(date: DateTime.now());
    if (todayAttendance.isNotEmpty) {
      todayAttendanceId.value = todayAttendance.first.id.toString();
      startTime.value = timeFormat.format(todayAttendance.first.startTime!);
      attachmentIn.value = todayAttendance.first.attachmentPathIn ?? "";
      endTime.value = (todayAttendance.first.endTime != null)
          ? timeFormat.format(todayAttendance.first.endTime!)
          : "--|--";
      attachmentOut.value = todayAttendance.first.attachmentPathOut ?? "";
      // if (todayAttendance.first.endTime != null) {
      //   hideButton.value = true;
      // }
    }
  }

  initIncompleteAttendance() async {
    var incomplete = await attendanceRepo.getIncompleteAttendance();
    if (incomplete.isNotEmpty) {
      incompleteStartTime.value =
          timeFormat.format(incomplete.first.startTime!);
      incompleteAttachmentIn.value = incomplete.first.attachmentPathIn ?? "";
      incompleteId.value = incomplete.first.id.toString();

      if (incomplete.first.endTime != null) {
        incompleteEndTime.value = timeFormat.format(incomplete.first.endTime!);
        incompleteAttachmentOut.value =
            incomplete.first.attachmentPathOut ?? "";
      }
    }

    // if (attendanceData.isNotEmpty) {
    //   recordAttendanceText.value = "Clock out";
    //    Get.find<Storage>().setShiftType = "out";
    //    Get.find<Storage>().setClockInId = attendanceData[0].id.toString();
    //   startTime.value = timeFormat.format(attendanceData[0].startTime!);
    //   attachmentIn.value = attendanceData[0].attachmentPathIn ?? "";
    //   endTime.value = (attendanceData[0].endTime != null) ? timeFormat.format(attendanceData[0].endTime!) : "--|--";

    //   hideButton.value = attendanceData[0].endTime != null ? true : false;
    //   attachmentOut.value = attendanceData[0].attachmentPathOut ?? "";
    // } else {
    //    Get.find<Storage>().setShiftType = "in";
    //   recordAttendanceText.value = "Clock in";
    // }
  }

  void recordIncomplete() {
    log("recordIncomplete");
    Get.find<Storage>().setClockInId = incompleteId.value;
    Get.find<Storage>().setShiftType = "out";
    Get.toNamed(attendance_location.AttendanceLocation.route);
  }

  void recordAttendance() {
    if (todayAttendanceId.value != "") {
      Get.find<Storage>().setShiftType = "out";
      Get.find<Storage>().setClockInId = todayAttendanceId.value;
    } else {
      Get.find<Storage>().setShiftType = "in";
    }
    Get.toNamed(attendance_location.AttendanceLocation.route);
  }
}

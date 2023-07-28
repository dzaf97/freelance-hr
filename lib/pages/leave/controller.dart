import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:myezhr/models/leave/leave.dart';
import 'package:myezhr/models/leave/leave_request.dart';
import 'package:myezhr/models/leave/leave_type.dart';
import 'package:myezhr/models/user/user.dart';
import 'package:myezhr/repositories/leave_repo.dart';
import 'package:myezhr/utils/storage.dart';
import 'package:myezhr/widgets/dropdown_form.dart';

class LeaveController extends GetxController {
  // Dependency Injected
  LeaveRepo leaveRepo = LeaveRepo();

  // Form variable
  var leaveTypes = <DropdownValue>[];
  var selectedLeaveType = DropdownValue(name: "", value: 0).obs;
  var remarks = TextEditingController();
  var startDate = DateTime.now().obs;
  var endDate = DateTime.now().obs;
  var selectedDate =
      DateTimeRange(start: DateTime.now(), end: DateTime.now()).obs;
  var file = File('').obs;

  // UI variable
  var isLoading = true.obs;
  var selectedCalendar = DateTime.now().obs;
  var selectedTab = 0.obs;
  var balance = <LeaveBalance>[].obs;
  var calendar = <LeaveCalendar>[].obs;
  var storeLeaves = RxList<Leave>();

  @override
  void onInit() async {
    await setup();
    super.onInit();
  }

  Future<void> setup() async {
    storeLeaves.value = await leaveRepo.getLeave();

    if (storeLeaves.isNotEmpty) {
      DateTime currentTime = DateTime.now();
      int selectedDay =
          DateTime(currentTime.year, currentTime.month, currentTime.day)
              .millisecondsSinceEpoch;

      calendar.value = storeLeaves
          .where((element) =>
              selectedDay >= element.startDate!.millisecondsSinceEpoch &&
              selectedDay <= element.endDate!.millisecondsSinceEpoch)
          .map((e) => LeaveCalendar(
                title: e.leaveType?.type ?? "",
                status: e.status ?? "Pending",
                name: Get.find<Storage>().getUser.name ?? "-",
              ))
          .toList();
    }

    List<LeaveType> _leaveTypes = await leaveRepo.getLeaveType();
    if (_leaveTypes.isNotEmpty) {
      leaveTypes = _leaveTypes
          .map((e) => DropdownValue(name: e.type!, value: e.id!.toInt()))
          .toList();
      selectedLeaveType.value = leaveTypes[0];

      balance.value = _leaveTypes
          .map((e) => LeaveBalance(
              leaveType: e.type!,
              usedLeave: e.pivot?.used ?? 0,
              totalLeave: e.pivot?.entitled ?? 0))
          .toList();
    }

    isLoading(false);
  }

  void onDateSelected(DateTime date) {
    calendar.clear();
    User userData = Get.find<Storage>().getUser;
    int selectedDay = date.millisecondsSinceEpoch;

    calendar.value = storeLeaves
        .where((element) =>
            selectedDay >= element.startDate!.millisecondsSinceEpoch &&
            selectedDay <= element.endDate!.millisecondsSinceEpoch)
        .map((e) => LeaveCalendar(
              title: e.leaveType!.type!,
              status: e.status ?? "Pending",
              name: userData.name ?? "-",
            ))
        .toList();
  }

  Future<void> submitForm(LeaveRequest request) async {
    log("Leave Request :: ${request.toJson()}");
    EasyLoading.show();
    LeaveReqModel res = await leaveRepo.postLeave(request);
    EasyLoading.dismiss();
    if (res.success) {
      await setup();
      Get.back();
      Get.showSnackbar(
        GetSnackBar(
          message: res.message[0]!,
          margin: const EdgeInsets.symmetric(horizontal: 10),
        ),
      );
    } else {
      Get.showSnackbar(
        GetSnackBar(
          message: res.message[0]!,
          margin: const EdgeInsets.symmetric(horizontal: 10),
        ),
      );
    }

    remarks.clear();
    // startDate = DateTime.now().obs;
    // endDate = DateTime.now().obs;
    selectedDate =
        DateTimeRange(start: DateTime.now(), end: DateTime.now()).obs;
    file = File('').obs;
  }

  cancelLeave(Leave leave) async {
    // List<Leave> response = await leaveRepo.deleteLeave(leave.id ?? 0);
    await leaveRepo.updateLeave(
        LeaveRequest(status: "pending-cancel"), leave.id.toString());
    await setup();
    Get.back();
    Get.showSnackbar(
      const GetSnackBar(
        message: "Leave is now pending for cancel!",
        margin: EdgeInsets.symmetric(horizontal: 10),
      ),
    );
  }

  // revertCancel(Leave leave) async {
  //   // List<Leave> response = await leaveRepo.deleteLeave(leave.id ?? 0);
  //   await leaveRepo.updateLeave(LeaveRequest(status: "approved"), leave.id.toString());
  //   await setup();
  //   Get.back();
  //   Get.showSnackbar(
  //     const GetSnackBar(
  //       message: "Leave cancellation has been revert!",
  //       margin: EdgeInsets.symmetric(horizontal: 10),
  //     ),
  //   );
  // }

  deleteLeave(Leave leave) async {
    await leaveRepo.deleteLeave(leave.id ?? 0);
    // await leaveRepo.updateLeave(LeaveRequest(status: "cancel"), leave.id.toString());
    await setup();
    Get.back();
    Get.showSnackbar(
      const GetSnackBar(
        message: "Leave deleted successfully!",
        margin: EdgeInsets.symmetric(horizontal: 10),
      ),
    );
  }
}

/*
-  UI Model
*/

class LeaveBalance {
  final String leaveType;
  final num usedLeave;
  final num totalLeave;

  LeaveBalance({
    required this.leaveType,
    required this.usedLeave,
    required this.totalLeave,
  });
}

class LeaveCalendar {
  final String title;
  final String status;
  final String name;

  LeaveCalendar({
    required this.title,
    required this.status,
    required this.name,
  });
}

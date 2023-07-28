import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:myezhr/models/overtime/overtime.dart';
import 'package:myezhr/models/overtime/overtime_request.dart';
import 'package:myezhr/repositories/overtime_repo.dart';
import 'package:myezhr/widgets/dropdown_form.dart';

class OvertimeController extends GetxController {
  // Dependency Injected
  final OvertimeRepo overtimeRepo = OvertimeRepo();

  // UI variable
  final ScrollController scrollController = ScrollController();
  var selectedTab = 0.obs;
  var isLoading = true.obs;
  var focusedDay = DateTime.now().obs;
  var overtimeTeammates = <OvertimeData>[].obs;
  var overtimeHistory = <OvertimeModel>[].obs;

  // Form Variable
  var page = 1.obs;
  // var startDate = DateTime.now().obs;
  // var endDate = DateTime.now().obs;
  var selectedDate =
      DateTimeRange(start: DateTime.now(), end: DateTime.now()).obs;
  var overtimeTypes = <DropdownValue>[];
  var selectedOvertimeType = DropdownValue(name: "", value: 0).obs;
  var attachment = File("").obs;
  TextEditingController remarks = TextEditingController();
  var overtimeDetails = <OvertimeDetail>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await setupCalendar();
    await setupHistory();
    await setupOvertimeType();
  }

  Future<void> setupCalendar() async {
    List<OvertimeModel> _overtimeTeammates =
        await overtimeRepo.getOvertimeTeammates();

    for (var _overtimeTeammate in _overtimeTeammates) {
      for (var detail in _overtimeTeammate.details ?? []) {
        log(_overtimeTeammate.createdAt!.toIso8601String());
        overtimeTeammates.add(
          OvertimeData(
              status: _overtimeTeammate.status ?? "",
              name: _overtimeTeammate.user!.name,
              startTime: detail.startTime,
              endTime: detail.endTime,
              createdAt: _overtimeTeammate.createdAt!),
        );
      }
    }
  }

  Future<void> setupHistory() async {
    overtimeHistory.value = await overtimeRepo.getOvertime();
  }

  Future<void> setupOvertimeType() async {
    List<OvertimeType> _overtimeTypes = await overtimeRepo.getOvertimeType();
    overtimeTypes = _overtimeTypes
        .map((e) => DropdownValue(name: e.type, value: e.id))
        .toList();
    selectedOvertimeType.value = overtimeTypes[0];
  }

  void onDaySelected(DateTime selectedDay, DateTime _focusedDay) {
    focusedDay.value = _focusedDay;
  }

  void submitForm(OvertimeRequest request) async {
    EasyLoading.show();
    OvertimeRequestModel response = await overtimeRepo.postOvertime(request);
    EasyLoading.dismiss();
    if (response.success) {
      await setupHistory();
      Get.back();
    }
  }
}

class OvertimeData {
  final String status;
  final String name;
  final String startTime;
  final String endTime;
  final DateTime createdAt;

  OvertimeData({
    required this.status,
    required this.name,
    required this.startTime,
    required this.endTime,
    required this.createdAt,
  });
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:myezhr/pages/attendance/controller.dart';
import 'package:myezhr/pages/attendance/correction_form/correction.dart';
import 'package:myezhr/pages/attendance/correction_form/correction_form.dart';
import 'package:myezhr/pages/attendance/history.dart';
import 'package:myezhr/pages/attendance/record.dart';
import 'package:myezhr/pages/attendance/record_form/attendance_location.dart';
import 'package:myezhr/widgets/button.dart';

class Attendance extends GetView<AttendanceController> {
  const Attendance({Key? key}) : super(key: key);

  static String route = "/attendance";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          elevation: 0,
          title: const Text("Attendance"),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 15),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(Icons.settings_outlined),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Container(
              height: 36,
              padding: const EdgeInsets.all(3),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                  color: const Color(0xFFe3e3e7),
                  borderRadius: BorderRadius.circular(8)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black,
                  indicator: ShapeDecoration(
                    color: Colors.white,
                    shadows: kElevationToShadow[2],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelPadding: const EdgeInsets.all(0),
                  indicatorPadding: const EdgeInsets.all(0),
                  onTap: (index) {
                    controller.selectedTab(index);
                  },
                  tabs: const [
                    Tab(text: "Record"),
                    Tab(text: "History"),
                    Tab(text: "Correction"),
                  ],
                ),
              ),
            ),
            Obx(
              () => [
                Record(
                  attendanceRecords: controller.attendanceRecords,
                  isLoading: controller.isLoading,
                  name: controller.name,
                  today: controller.today,
                  todayShift: controller.todayShift,
                ),
                History(attendanceRecords: controller.attendanceRecords),
                Correction(
                  attendanceCorrections: controller.attendanceCorrections,
                ),
              ][controller.selectedTab.value],
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Obx(
          () => (controller.selectedTab.value != 2)
              ? (controller.hideButton.value)
                  ? Container()
                  : AppButton(
                      onPressed: () async {
                        if (controller.location.permission == null) {
                          await controller.location.askPermission();
                        }
                        if (controller.location.permission ==
                            LocationPermission.always) {
                          await controller.setLocation();
                          Get.toNamed(AttendanceLocation.route);
                        } else if (controller.location.permission ==
                            LocationPermission.whileInUse) {
                          await controller.setLocation();
                          Get.toNamed(AttendanceLocation.route);
                        } else {
                          await controller.location.askPermission();
                        }
                      },
                      width: Get.width * 0.9,
                      title: "Record Attendance",
                    )
              : AppButton(
                  onPressed: () => Get.bottomSheet(
                    CorrectionForm(
                      selectedDate: controller.date,
                      submitForm: controller.submitForm,
                      timeIn: controller.timeIn,
                      timeOut: controller.timeOut,
                      reason: controller.reason,
                      selectedShift: controller.selectedShift,
                      shifts: controller.shifts,
                      userId: controller.userId,
                    ),
                    isScrollControlled: true,
                  ),
                  width: Get.width * 0.9,
                  title: "Create New Correction",
                ),
        ),
      ),
    );
  }
}

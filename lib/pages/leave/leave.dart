import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myezhr/pages/leave/balance.dart';
import 'package:myezhr/pages/leave/calendar.dart';
import 'package:myezhr/pages/leave/controller.dart';
import 'package:myezhr/pages/leave/history.dart';
import 'package:myezhr/pages/leave/leave_form.dart';
import 'package:myezhr/widgets/button.dart';

class Leave extends GetView<LeaveController> {
  const Leave({Key? key}) : super(key: key);

  static String route = "/leave";

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
          title: const Text("Leave"),
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
                    Tab(text: "Balance"),
                    Tab(text: "History"),
                    Tab(text: "Calendar"),
                  ],
                ),
              ),
            ),
            Obx(
              () => [
                Balance(
                  leaveBalances: controller.balance,
                  isLoading: controller.isLoading,
                ),
                const History(),
                Calendar(
                  leaveCalendars: controller.calendar,
                  onDateSelected: controller.onDateSelected,
                ),
              ][controller.selectedTab.value],
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: AppButton(
          onPressed: () => Get.bottomSheet(
            LeaveForm(
              leaveTypes: controller.leaveTypes,
              selectedLeaveType: controller.selectedLeaveType,
              startDate: controller.startDate,
              endDate: controller.endDate,
              remarks: controller.remarks,
              file: controller.file,
              submitForm: controller.submitForm,
              selectedDate: controller.selectedDate,
            ),
            isScrollControlled: true,
          ),
          width: Get.width * 0.9,
          title: "New Request",
        ),
      ),
    );
  }
}

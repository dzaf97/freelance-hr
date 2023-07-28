import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myezhr/pages/overtime/calendar.dart';
import 'package:myezhr/pages/overtime/controller.dart';
import 'package:myezhr/pages/overtime/history.dart';
import 'package:myezhr/pages/overtime/overtime_form.dart';
import 'package:myezhr/widgets/button.dart';

class Overtime extends GetView<OvertimeController> {
  const Overtime({Key? key}) : super(key: key);

  static String route = "/overtime";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: GestureDetector(
            onTap: () => controller.scrollController.animateTo(
              controller.scrollController.position.minScrollExtent,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 500),
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          elevation: 0,
          title: const Text("Overtime"),
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
                    Tab(text: "Calendar"),
                    Tab(text: "History"),
                  ],
                ),
              ),
            ),
            Obx(
              () => [
                Calendar(
                  focusedDay: controller.focusedDay,
                  scrollController: controller.scrollController,
                  onDaySelected: controller.onDaySelected,
                  overtimeTeammates: controller.overtimeTeammates,
                ),
                History(overtimeHistory: controller.overtimeHistory),
              ][controller.selectedTab.value],
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: AppButton(
          onPressed: () {
            controller.page.value = 1;
            Get.bottomSheet(
              OvertimeForm(
                submitForm: controller.submitForm,
                selectedDate: controller.selectedDate,
                overtimeTypes: controller.overtimeTypes,
                selectedOvertimeType: controller.selectedOvertimeType,
                attachment: controller.attachment,
                remarks: controller.remarks,
                page: controller.page,
                overtimeDetails: controller.overtimeDetails,
              ),
              isScrollControlled: true,
            );
          },
          width: Get.width * 0.9,
          title: "Submit New Overtime",
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myezhr/pages/business_trip/business_form.dart';
import 'package:myezhr/pages/business_trip/calendar.dart';
import 'package:myezhr/pages/business_trip/controller.dart';
import 'package:myezhr/pages/business_trip/history.dart';
import 'package:myezhr/widgets/button.dart';

class BusinessTrip extends GetView<BusinessTripController> {
  const BusinessTrip({Key? key}) : super(key: key);

  static String route = "/business-trip";

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
          title: const Text("Business Trip"),
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
                  trips: controller.history,
                ),
                History(tripHistory: controller.history),
              ][controller.selectedTab.value],
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: AppButton(
          onPressed: () {
            controller.page.value = 1;
            Get.to(
              () => const BusinessForm(),
            );
          },
          width: Get.width * 0.9,
          title: "Submit New Business Trip",
        ),
      ),
    );
  }
}

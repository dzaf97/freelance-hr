import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myezhr/pages/home_layout/home/controller.dart';
import 'package:myezhr/utils/formatter.dart';
import 'package:myezhr/utils/storage.dart';
import 'package:myezhr/utils/theme.dart';
import 'package:myezhr/widgets/attendance_box.dart';
import 'package:myezhr/widgets/button.dart';

class Home extends GetView<HomeController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColor.primary,
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(30)),
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 50, 0, 10),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: ClipOval(
                        child: (controller.profileImg.value != "")
                            ? Image.network(controller.profileImg.value)
                            : Image.asset("assets/images/user.png"),
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      controller.name.value,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    Get.find<Storage>().getCompanyName ?? "Demo",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppBarButton(
                        value: controller.shift,
                        image: Image.asset(
                          'assets/images/Calendar.png',
                          height: 20,
                          color: AppColor.primary,
                        ),
                      ),
                      AppBarButton(
                        value: controller.location,
                        image: Image.asset(
                          'assets/images/Location.png',
                          height: 20,
                          color: AppColor.primary,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          // const QuickLinks(),

          RefreshIndicator(
            onRefresh: () async {
              await controller.initTodayShift();
              await controller.initTodayAttendance();
              await controller.initIncompleteAttendance();
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Container(
                padding: const EdgeInsets.only(top: 10),
                constraints: BoxConstraints(maxHeight: Get.height * 0.8),
                child: Column(
                  children: [
                    Obx(
                      () => (controller.incompleteAttachmentIn.value != "-" &&
                              controller.incompleteAttachmentOut.value != "-")
                          ? Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 16),
                                  alignment: Alignment.centerLeft,
                                  child: const Text(
                                    "Incomplete attendance",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                AttendanceBox(
                                  attachmentIn:
                                      controller.incompleteAttachmentIn.value,
                                  attachmentOut:
                                      controller.incompleteAttachmentOut.value,
                                  date:
                                      "Yesterday, (${dayDateFormat.format(DateTime.now().subtract(const Duration(days: 1)))})",
                                  endTime: controller.incompleteEndTime.value,
                                  startTime:
                                      controller.incompleteStartTime.value,
                                ),
                                // AppButton(
                                //   width: Get.width * 0.9,
                                //   onPressed: () => controller.recordIncomplete(),
                                //   title: "Clock out",
                                // )
                                (controller.endTime.value == "--|--")
                                    ? AppButton(
                                        width: Get.width * 0.9,
                                        onPressed: () =>
                                            controller.recordIncomplete(),
                                        title: "Clock out",
                                      )
                                    : Container()
                              ],
                            )
                          : Container(),
                    ),
                    Obx(
                      () => (controller.isTodayAttendance.value)
                          ? Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 16),
                                  alignment: Alignment.centerLeft,
                                  child: const Text(
                                    "Today attendance",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                AttendanceBox(
                                  attachmentIn: controller.attachmentIn.value,
                                  attachmentOut: controller.attachmentOut.value,
                                  date:
                                      "Today, (${dayDateFormat.format(DateTime.now())})",
                                  endTime: controller.endTime.value,
                                  startTime: controller.startTime.value,
                                ),
                              ],
                            )
                          : Container(
                              margin: const EdgeInsets.only(top: 150),
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Text(
                                "You have no shift for today's date",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Obx(
                        () => (controller.isTodayAttendance.value)
                            ? controller.hideButton.value
                                ? Container()
                                : AppButton(
                                    width: Get.width * 0.9,
                                    onPressed: () =>
                                        controller.recordAttendance(),
                                    title:
                                        controller.recordAttendanceText.value,
                                  )
                            : Container(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class QuickLinks extends StatelessWidget {
  const QuickLinks({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          alignment: Alignment.centerLeft,
          child: const Text(
            "Quick links",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     MenuLink(
        //       image: Image.asset('assets/images/Leave.png'),
        //       linkName: 'Leave',
        //       onTap: () => Get.toNamed(Leave.route),
        //     ),
        //     MenuLink(
        //       image: Image.asset('assets/images/Attendance.png'),
        //       linkName: 'Attendance',
        //       onTap: () => Get.toNamed(Attendance.route),
        //     ),
        //     MenuLink(
        //       image: Image.asset('assets/images/Claim.png'),
        //       linkName: 'Claim',
        //       onTap: () => Get.toNamed(Claim.route),
        //     ),
        //     MenuLink(
        //       image: Image.asset('assets/images/Payslip.png'),
        //       linkName: 'PaySlip',
        //       onTap: () => Get.toNamed(Payslip.route),
        //     )
        //   ],
        // ),
        const Padding(padding: EdgeInsets.only(bottom: 10))
      ],
    );
  }
}

class AppBarButton extends StatelessWidget {
  const AppBarButton({
    Key? key,
    required this.value,
    required this.image,
  }) : super(key: key);

  final Image image;
  final RxString value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            image,
            Obx(
              () => Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(value.value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

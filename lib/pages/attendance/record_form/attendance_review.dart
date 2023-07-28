import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myezhr/models/attendance/request.dart';
import 'package:myezhr/pages/attendance/controller.dart';
import 'package:myezhr/utils/formatter.dart';
import 'package:myezhr/utils/storage.dart';
import 'package:myezhr/widgets/button.dart';

class AttendanceReview extends GetView<AttendanceController> {
  const AttendanceReview({Key? key}) : super(key: key);

  static String route = "/attendance/record/review";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        elevation: 0,
        title: const Text("Attendance Record"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.memory(
                  controller.camera.picture.value,
                  height: Get.height * 0.4,
                ),
                // child: Image.asset('assets/images/placeholder.png'),
              ),
            ),
            Obx(
              () => Text(
                controller.name.value,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
              child: Obx(
                () => Text(
                  controller.designation.value,
                  style: const TextStyle(color: Color(0xFF686777)),
                ),
              ),
            ),
            Column(
              children: [
                Text(dateFormat.format(controller.recordTimeIn.value)),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    (Get.find<Storage>().getShiftType == "in")
                        ? "Clock In at ${timeFormat.format(controller.recordTimeIn.value)}"
                        : "Clock Out at ${timeFormat.format(controller.recordTimeIn.value)}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            const Spacer(),
            SafeArea(
              child: AppButton(
                width: Get.width * 0.9,
                onPressed: () => controller.recordAttendance(
                  AttendanceRequest(
                    shiftDailyId: controller.shiftDailyId.value.toString(),
                    type: Get.find<Storage>().getShiftType,
                    startTime: (Get.find<Storage>().getShiftType == "in")
                        ? formDateTimeFormat
                            .format(controller.recordTimeIn.value)
                        : null,
                    endTime: (Get.find<Storage>().getShiftType == "out")
                        ? formDateTimeFormat
                            .format(controller.recordTimeIn.value)
                        : null,
                    latLong:
                        "${controller.currentLocation.value.latitude.toPrecision(4)},${controller.currentLocation.value.longitude.toPrecision(4)}",
                    file: controller.camera.path.value,
                  ),
                ),
                title: "Save Attendance",
              ),
            )
          ],
        ),
      ),
    );
  }
}

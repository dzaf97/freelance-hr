import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:myezhr/pages/attendance/controller.dart';
import 'package:myezhr/widgets/button.dart';

class AttendanceLocation extends GetView<AttendanceController> {
  const AttendanceLocation({Key? key}) : super(key: key);

  static String route = "/attendance/record/location";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Stack(
          children: [
            FlutterMap(
              mapController: controller.mapController,
              options: MapOptions(
                center: controller.currentLocation.value,
                zoom: 15,
              ),
              nonRotatedChildren: [
                AttributionWidget.defaultWidget(
                  source: 'OpenStreetMap contributors',
                  onSourceTapped: null,
                ),
              ],
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
                Obx(() => MarkerLayer(
                      markers: controller.markers.value,
                    )),
              ],
            ),
            SizedBox(
              height: AppBar().preferredSize.height +
                  MediaQuery.of(context).padding.top,
              child: AppBar(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                ),
                elevation: 0,
                title: const Text("Attendance Record"),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SafeArea(
                child: Container(
                  width: Get.width * 0.9,
                  height: Get.height * 0.2,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xFFD1D1D6),
                    ),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 5,
                        offset: const Offset(1, 5),
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Is your location accurate?",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      Obx(
                        () => Text(
                          "Accurate up to ${controller.accuracy.value.toInt()} meter",
                          style: const TextStyle(
                            color: Color(0xFF686777),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AppButton(
                            onPressed: () async =>
                                await controller.setLocation(),
                            title: "Refresh",
                            color: const Color(0xFFAEAEB2),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 13),
                            width: Get.width * 0.4,
                          ),
                          AppButton(
                            onPressed: () => controller.goToCamera(),
                            title: "Yes",
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 13),
                            width: Get.width * 0.4,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

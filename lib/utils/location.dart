import 'dart:developer';
import 'dart:ui';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class Location extends GetxController {
  LocationPermission? permission;
  // Rx<Position> position = Position(
  //         longitude: 0.0,
  //         latitude: 0.0,
  //         timestamp: DateTime.now(),
  //         accuracy: 0,
  //         altitude: 0,
  //         heading: 0,
  //         speed: 0,
  //         speedAccuracy: 0)
  //     .obs;

  @override
  void onInit() async {
    DartPluginRegistrant.ensureInitialized();

    // // permission = await Geolocator.checkPermission();
    // if (permission != LocationPermission.always) {
    //   await askPermission();
    // }
    super.onInit();
  }

  askPermission() async {
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      log("Permission Location denied!", name: "Location");
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        log("Permission Location denied!", name: "Location");
        Get.defaultDialog(
          title: "Permission Error",
          middleText: "Location permissions are denied",
        );
      }
    }

    if (permission == LocationPermission.deniedForever) {
      log("Permission Location denied forever!", name: "Location");
      // Permissions are denied forever, handle appropriately.
      Get.defaultDialog(
        title: "Permission Error",
        middleText:
            'Location permissions are permanently denied, we cannot request permissions.',
      );
    }
  }

  Future<Position> getCurrentPosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    return position;
  }

  bool checkRadius(LatLng start, LatLng end, double radius) {
    var meter = Geolocator.distanceBetween(
        start.latitude, start.longitude, end.latitude, end.longitude);
    log("Radius: $radius", name: "Location");
    log("Distance: $meter", name: "Location");
    // Get.showSnackbar(GetSnackBar(
    //   title: "Radius",
    //   message: radius.toString(),
    //   snackPosition: SnackPosition.TOP,
    // ));
    // Get.snackbar("Radius", radius.toString());
    // Get.snackbar("Distance (m)", meter.toString());
    return meter < radius;
  }
}

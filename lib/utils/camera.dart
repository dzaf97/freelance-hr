import 'dart:developer';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:get/get.dart';

class Camera extends GetxController {
  var cameras = <CameraDescription>[].obs;
  late CameraController? camera;
  late Future<void> initializeControllerFuture;
  var path = "".obs;
  var picture = Uint8List(0).obs;
  var flash = false;
  int currentCamera = 0;

  @override
  void onInit() async {
    await initCamera();
    super.onInit();
  }

  @override
  void onClose() {
    if (camera != null) {
      camera!.dispose();
    }
    super.onClose();
  }

  initCamera() async {
    cameras.value = await availableCameras();

    if (cameras.isNotEmpty) {
      camera = CameraController(cameras[currentCamera], ResolutionPreset.high);
      initializeControllerFuture = camera!.initialize();
    }
  }

  changeCamera() {
    currentCamera = currentCamera == 0 ? 1 : 0;
    camera = CameraController(cameras[currentCamera], ResolutionPreset.high);
    initializeControllerFuture = camera!.initialize();
  }

  Future<void> takePicture() async {
    String route = Get.arguments;
    XFile _picture = await camera!.takePicture();
    path.value = _picture.path;
    Uint8List data = await _picture.readAsBytes();
    picture.value = data;
    Get.toNamed(route);
  }
}

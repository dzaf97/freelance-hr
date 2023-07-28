import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myezhr/utils/camera.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  static String route = "/camera";

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  final controller = Get.put(Camera());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return CameraPreview(
            controller.camera!,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SafeArea(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => Get.back(),
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SafeArea(
                    child: FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: () => controller.takePicture(),
                    ),
                  ),
                  SafeArea(
                    child: Material(
                      color: Colors.transparent,
                      child: IconButton(
                        icon: const Icon(
                          Icons.cameraswitch,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          controller.changeCamera();
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

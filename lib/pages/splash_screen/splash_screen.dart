import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myezhr/pages/splash_screen/controller.dart';

class Splash extends GetView<SplashController> {
  static String route = '/splash';

  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    );
  }
}

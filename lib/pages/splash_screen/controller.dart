import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:myezhr/pages/login/login.dart';
import 'package:myezhr/utils/network.dart';
import 'package:myezhr/utils/storage.dart';
import 'package:myezhr/utils/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    EasyLoading.instance.maskType = EasyLoadingMaskType.black;
    EasyLoading.instance.dismissOnTap = false;
    EasyLoading.instance.loadingStyle = EasyLoadingStyle.custom;
    EasyLoading.instance.indicatorType = EasyLoadingIndicatorType.wave;
    EasyLoading.instance.backgroundColor = AppColor.primary;
    EasyLoading.instance.textColor = Colors.black;
    EasyLoading.instance.indicatorColor = Colors.white;
    EasyLoading.instance.displayDuration = 2.seconds;
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    Get.put(Storage(await _prefs), permanent: true);
    Get.put(Network());
    super.onInit();
  }

  @override
  void onReady() {
    Get.toNamed(Login.route);
    super.onReady();
  }
}

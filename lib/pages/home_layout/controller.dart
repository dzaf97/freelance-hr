import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:myezhr/pages/home_layout/company/controller.dart';
import 'package:myezhr/pages/home_layout/features/controller.dart';
import 'package:myezhr/pages/home_layout/home/controller.dart';
import 'package:myezhr/pages/home_layout/profile/controller.dart';
import 'package:myezhr/pages/home_layout/request/controller.dart';
import 'package:myezhr/utils/theme.dart';

class HomeLayoutController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  var selectedTab = 0.obs;

  onItemSelected(int value) {
    selectedTab.value = value;
    if (selectedTab.value == 0) {
      Get.replace(HomeController());
    } else if (selectedTab.value == 1) {
      Get.replace(FeatureController());
    }
    //  else if (selectedTab.value == 2) {
    //   Get.replace(CompanyController());
    // }
    else if (selectedTab.value == 2) {
      Get.replace(RequestController());
    } else if (selectedTab.value == 3) {
      Get.replace(ProfileController());
    }
  }
}

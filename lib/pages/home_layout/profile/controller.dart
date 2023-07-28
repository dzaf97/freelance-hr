import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myezhr/models/user/user.dart';
import 'package:myezhr/pages/login/login.dart';
import 'package:myezhr/utils/network.dart';
import 'package:myezhr/utils/storage.dart';

class ProfileController extends GetxController {
  var name = "".obs;
  var image = "".obs;

  @override
  void onInit() async {
    await setup();
    super.onInit();
  }

  setup() async {
    User userData = Get.find<Storage>().getUser;
    name.value = userData.name ?? "-";
    if (userData.photoUrl != null) {
      image.value = cloudPath + userData.photoUrl;
    }
  }

  logout() async {
    // await Get.find<Storage>().box.erase();
    await Get.find<Storage>().prefs.clear();
    Get.offNamedUntil(Login.route, ModalRoute.withName(Login.route));
  }
}

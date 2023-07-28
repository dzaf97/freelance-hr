import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myezhr/pages/login/login.dart';
import 'package:myezhr/utils/network.dart';
import 'package:myezhr/utils/storage.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    Get.find<Network>().setToken(Get.find<Storage>().getToken ?? "");
    return (Get.find<Storage>().getToken == null)
        ? RouteSettings(name: Login.route)
        : null;
  }
}

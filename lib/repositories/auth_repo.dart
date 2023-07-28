import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:myezhr/models/login/login.dart';
import 'package:myezhr/models/login/login_request.dart';
import 'package:myezhr/utils/network.dart';
import 'package:myezhr/utils/storage.dart';

class AuthRepo {
  Network network = Get.find();

  Future<LoginModel> login(LoginRequest request) async {
    NetworkMsg response =
        await network.post(url: '/login', body: request.toJson());

    if (response.success) {
      LoginModel loginModel = LoginModel.fromJson(response.data["data"]);
      network.setToken(loginModel.token ?? "");
      Get.find<Storage>().setToken = loginModel.token ?? "";
      Get.find<Storage>().setUser = loginModel.user!;
      return loginModel;
    } else {
      return LoginModel(token: null, user: null, message: response.message[0]!);
    }
  }
}

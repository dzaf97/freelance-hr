import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myezhr/models/payslip/payslip.dart';
import 'package:myezhr/repositories/payslip_repo.dart';
import 'package:myezhr/utils/storage.dart';
import 'package:url_launcher/url_launcher.dart';

class PayslipController extends GetxController {
  // Dependency Injected
  final payslipRepo = PayslipRepo();

  // UI variable
  var isLoading = true.obs;
  var payslips = <Payslip>[].obs;
  var password = TextEditingController();

  @override
  void onInit() async {
    await setup();
    super.onInit();
  }

  setup() async {
    List<Payslip> _payslips = await payslipRepo.getPayslip();
    if (_payslips.isNotEmpty) {
      payslips.value = _payslips;
    }
  }

  validatePassword(String attachment) {
    log("validatePassword", name: "Payslip");
    log(password.text, name: "Payslip");
    final String _password = Get.find<Storage>().getPassword;
    if (password.text == _password) {
      Get.back();
      (GetPlatform.isAndroid)
          ? launchUrl(Uri.parse(attachment),
              mode: LaunchMode.externalApplication)
          : launchUrl(Uri.parse(attachment));
    } else {
      Get.back();
      Get.showSnackbar(
        const GetSnackBar(
          duration: Duration(seconds: 2),
          message: "Wrong Password!",
          margin: EdgeInsets.symmetric(horizontal: 10),
        ),
      );
    }
  }
}

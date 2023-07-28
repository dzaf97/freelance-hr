import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myezhr/pages/home_layout/company/policy/policy_form.dart';

class CompanyPolicyController extends GetxController {
  // Form variable
  var policyName = TextEditingController();
  var policyContent = TextEditingController();
  var file = File("").obs;

  void openForm() {
    Get.bottomSheet(
      PolicyForm(
        submitForm: submitForm,
        file: file,
        policyContent: policyContent,
        policyName: policyName,
      ),
      isScrollControlled: true,
    );
  }

  void submitForm() {}
}

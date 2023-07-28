import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myezhr/widgets/button.dart';
import 'package:myezhr/widgets/filepicker_form.dart';
import 'package:myezhr/widgets/textfield_form.dart';

class PolicyForm extends StatelessWidget {
  const PolicyForm({
    Key? key,
    required this.submitForm,
    required this.policyName,
    required this.policyContent,
    required this.file,
  }) : super(key: key);

  final TextEditingController policyName;
  final TextEditingController policyContent;
  final Rx<File> file;
  final Function submitForm;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.9,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      child: Column(
        children: [
          AppBar(
            backgroundColor: Colors.white,
            elevation: 1,
            title: const Text(
              "Claim Form",
              style: TextStyle(color: Colors.black),
            ),
            leading: GestureDetector(
              onTap: () => Get.back(),
              child: const Icon(
                Icons.highlight_remove_sharp,
                color: Colors.black,
              ),
            ),
          ),
          FormTextField(controller: policyName, title: "Policy Name"),
          FormTextField(
            controller: policyContent,
            title: "Policy Content",
            maxLines: 3,
          ),
          FormFilePicker(title: "Attachment", file: file),
          Padding(
            padding: const EdgeInsets.only(top: 37),
            child: AppButton(
              width: Get.width * 0.9,
              onPressed: () => submitForm(),
              title: "Save",
            ),
          )
        ],
      ),
    );
  }
}

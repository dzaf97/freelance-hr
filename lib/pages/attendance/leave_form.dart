import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:myezhr/widgets/button.dart';
import 'package:myezhr/widgets/datepicker_form.dart';
import 'package:myezhr/widgets/dropdown_form.dart';
import 'package:myezhr/widgets/filepicker_form.dart';
import 'package:myezhr/widgets/textfield_form.dart';

class LeaveForm extends StatelessWidget {
  const LeaveForm({
    Key? key,
    required this.leaveTypes,
    required this.selectedLeaveType,
    required this.startDate,
    required this.endDate,
    required this.remarks,
    required this.file,
    required this.submitForm,
  }) : super(key: key);

  final List<DropdownValue> leaveTypes;
  final Rx<DropdownValue> selectedLeaveType;
  final Rx<DateTime> startDate;
  final Rx<DateTime> endDate;
  final TextEditingController remarks;
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
              "Leave Form",
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
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: FormDropdown(
              items: leaveTypes,
              title: "Leave Type",
              value: selectedLeaveType,
            ),
          ),
          FormDatePicker(
            selectedDate: startDate,
            title: "Start Date",
          ),
          FormDatePicker(
            selectedDate: endDate,
            title: "End Date",
          ),
          FormTextField(
            controller: remarks,
            title: "Remarks",
          ),
          FormFilePicker(
            title: "Attachment",
            file: file,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 37),
            child: AppButton(
              width: Get.width * 0.9,
              onPressed: () => submitForm(),
              title: "Submit",
            ),
          )
        ],
      ),
    );
  }
}

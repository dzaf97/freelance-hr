import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myezhr/models/overtime/overtime_request.dart';
import 'package:myezhr/utils/formatter.dart';
import 'package:myezhr/widgets/button.dart';
import 'package:myezhr/widgets/daterangepicker_form.dart';
import 'package:myezhr/widgets/dropdown_form.dart';
import 'package:myezhr/widgets/filepicker_form.dart';
import 'package:myezhr/widgets/textfield_form.dart';
import 'package:myezhr/widgets/timepicker_form.dart';

class OvertimeForm extends StatelessWidget {
  const OvertimeForm({
    Key? key,
    required this.submitForm,
    required this.selectedDate,
    required this.overtimeTypes,
    required this.selectedOvertimeType,
    required this.remarks,
    required this.attachment,
    required this.page,
    required this.overtimeDetails,
  }) : super(key: key);

  final TextEditingController remarks;
  final List<DropdownValue> overtimeTypes;
  final Rx<DropdownValue> selectedOvertimeType;
  final Rx<DateTimeRange> selectedDate;
  final Rx<File> attachment;
  final RxInt page;
  final RxList<OvertimeDetail> overtimeDetails;
  final Function submitForm;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.9,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.white,
              elevation: 1,
              title: const Text(
                "Overtime",
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
            Obx(
              () => (page.value == 1)
                  ? Overtime1(
                      selectedDate: selectedDate,
                      overtimeTypes: overtimeTypes,
                      selectedOvertimeType: selectedOvertimeType,
                      remarks: remarks,
                      attachment: attachment,
                      page: page,
                    )
                  : Overtime2(
                      selectedDate: selectedDate,
                      page: page,
                      selectedOvertimeType: selectedOvertimeType,
                      remarks: remarks,
                      attachment: attachment,
                      submit: submitForm,
                      overtimeDetails: overtimeDetails,
                    ),
            )
          ],
        ),
      ),
    );
  }
}

class Overtime1 extends StatelessWidget {
  const Overtime1({
    Key? key,
    required this.selectedDate,
    required this.overtimeTypes,
    required this.selectedOvertimeType,
    required this.remarks,
    required this.attachment,
    required this.page,
  }) : super(key: key);

  final Rx<DateTimeRange> selectedDate;
  final List<DropdownValue> overtimeTypes;
  final Rx<DropdownValue> selectedOvertimeType;
  final TextEditingController remarks;
  final Rx<File> attachment;
  final RxInt page;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormDateRangePicker(title: "Date", selectedDate: selectedDate),
        FormDropdown(
          items: overtimeTypes,
          title: "Overtime Type",
          value: selectedOvertimeType,
        ),
        FormTextField(controller: remarks, title: "Remarks"),
        FormFilePicker(title: "Attachment", file: attachment),
        Padding(
          padding: const EdgeInsets.only(top: 37),
          child: AppButton(
            width: Get.width * 0.9,
            onPressed: () => page.value++,
            title: "Next",
          ),
        ),
      ],
    );
  }
}

class Overtime2 extends StatelessWidget {
  const Overtime2({
    Key? key,
    required this.selectedDate,
    required this.page,
    required this.submit,
    required this.overtimeDetails,
    required this.selectedOvertimeType,
    required this.remarks,
    required this.attachment,
  }) : super(key: key);

  final Rx<DateTimeRange> selectedDate;
  final Rx<DropdownValue> selectedOvertimeType;
  final TextEditingController remarks;
  final Rx<File> attachment;
  final RxInt page;
  final RxList<OvertimeDetail> overtimeDetails;

  final Function submit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListDetail(
          startDate: Rx(selectedDate.value.start),
          endDate: Rx(selectedDate.value.start),
          overtimeDetails: overtimeDetails,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 37),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AppButton(
                color: const Color(0xFF686777),
                width: Get.width * 0.4,
                onPressed: () => page.value--,
                title: "Back",
              ),
              AppButton(
                width: Get.width * 0.4,
                onPressed: () => submit(
                  OvertimeRequest(
                    overtimeTypeId: selectedOvertimeType.value.value.toString(),
                    startDate: dateOnlyFormat.format(selectedDate.value.start),
                    endDate: dateOnlyFormat.format(selectedDate.value.end),
                    remarks: remarks.text,
                    file: (attachment.value.absolute.path != "/")
                        ? attachment.value.absolute.path
                        : "",
                    details: overtimeDetails,
                  ),
                ),
                title: "Next",
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ListDetail extends StatelessWidget {
  const ListDetail({
    Key? key,
    required this.startDate,
    required this.endDate,
    required this.overtimeDetails,
  }) : super(key: key);

  final Rx<DateTime> startDate;
  final Rx<DateTime> endDate;
  final RxList<OvertimeDetail> overtimeDetails;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        List<Widget> children = [const SizedBox(height: 15)];
        int totalDays = 1;
        if (dateOnlyFormat.format(startDate.value) !=
            dateOnlyFormat.format(endDate.value)) {
          totalDays = endDate.value.difference(startDate.value).inDays + 2;
        }

        for (var i = 0; i < totalDays; i++) {
          OvertimeDetail otDetail = OvertimeDetail(
            startTime: TimeOfDay.now().obs,
            endTime: TimeOfDay.now().obs,
            date: dateOnlyFormat.format(startDate.value.add(Duration(days: i))),
          );
          children.add(
            Container(
              width: Get.width * 0.9,
              margin: const EdgeInsets.symmetric(vertical: 6),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Details for ${dateMyFormat.format(startDate.value.add(Duration(days: i)))}",
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  FormTimePicker(
                      title: "Start time", selectedTime: otDetail.startTime!),
                  FormTimePicker(
                      title: "End time", selectedTime: otDetail.endTime!)
                ],
              ),
            ),
          );
          overtimeDetails.add(otDetail);
        }
        return Column(children: children);
      },
    );
  }
}

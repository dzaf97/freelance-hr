import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myezhr/models/attendance/request.dart';
import 'package:myezhr/utils/formatter.dart';
import 'package:myezhr/widgets/button.dart';
import 'package:myezhr/widgets/datepicker_form.dart';
import 'package:myezhr/widgets/dropdown_form.dart';
import 'package:myezhr/widgets/textfield_form.dart';
import 'package:myezhr/widgets/timepicker_form.dart';

class CorrectionForm extends StatelessWidget {
  const CorrectionForm({
    Key? key,
    required this.submitForm,
    required this.selectedDate,
    required this.timeIn,
    required this.timeOut,
    required this.reason,
    required this.selectedShift,
    required this.shifts,
    required this.userId,
  }) : super(key: key);

  final String userId;
  final TextEditingController reason;
  final Rx<DateTime> selectedDate;
  final Rx<TimeOfDay> timeIn;
  final Rx<TimeOfDay> timeOut;
  final Rx<DropdownValue> selectedShift;
  final List<DropdownValue> shifts;
  final Function submitForm;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
                "Correction Form",
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
            FormDatePicker(
              title: "Date",
              selectedDate: selectedDate,
              lastDate: DateTime.now(),
            ),
            FormDropdown(items: shifts, title: "Shift", value: selectedShift),
            FormTimePicker(title: "Start Time", selectedTime: timeIn),
            FormTimePicker(title: "End Time", selectedTime: timeOut),
            FormTextField(controller: reason, title: "Reason for Correction"),
            Padding(
              padding: const EdgeInsets.only(top: 37),
              child: AppButton(
                width: Get.width * 0.9,
                onPressed: () => submitForm(AttendanceCorrectionRequest(
                  date: dateOnlyFormat.format(selectedDate.value),
                  newStartTime:
                      "${timeIn.value.hour.toString().padLeft(2, '0')}:${timeIn.value.minute.toString().padLeft(2, '0')}:00",
                  newEndTime:
                      "${timeOut.value.hour.toString().padLeft(2, '0')}:${timeOut.value.minute.toString().padLeft(2, '0')}:00",
                  remarks: reason.text,
                  shiftDailyId: selectedShift.value.value.toString(),
                  userId: userId,
                )),
                title: "Submit",
              ),
            )
          ],
        ),
      ),
    );
  }
}

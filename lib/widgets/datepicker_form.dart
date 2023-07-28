import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class FormDatePicker extends StatelessWidget {
  FormDatePicker({
    Key? key,
    required this.title,
    required this.selectedDate,
    this.initialDate,
    this.lastDate,
    this.function,
    this.onChanged,
    this.hideIcon = false,
  }) : super(key: key);

  final String title;
  final Rx<DateTime> selectedDate;
  final DateTime? initialDate;
  final DateTime? lastDate;
  final Function? function;
  ValueChanged<DateTime>? onChanged;
  bool hideIcon;

  void onChangedHandler(DateTime value) {
    if (onChanged != null) {
      onChanged!(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (initialDate != null) {
      selectedDate.value = initialDate!;
    }
    return GestureDetector(
      onTap: () async {
        selectedDate.value = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: lastDate ?? DateTime(2050),
            ) ??
            selectedDate.value;

        if (onChanged != null) {
          onChangedHandler(selectedDate.value);
        }
      },
      child: Container(
        width: Get.width * 0.9,
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                title,
                style: const TextStyle(color: Color(0xFF686777)),
              ),
            ),
            Obx(
              () => TextField(
                enabled: false,
                decoration: InputDecoration(
                  suffixIcon: !hideIcon
                      ? const ImageIcon(
                          AssetImage('assets/images/Date.png'),
                          color: Color(0xFF686777),
                          size: 1,
                        )
                      : null,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  hintText: selectedDate.value.toIso8601String().split("T")[0],
                  hintStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xffE2E3E4)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

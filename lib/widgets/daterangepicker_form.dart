import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myezhr/utils/formatter.dart';

// ignore: must_be_immutable
class FormDateRangePicker extends StatelessWidget {
  FormDateRangePicker({
    Key? key,
    required this.title,
    required this.selectedDate,
    this.initialDate,
    this.onChanged,
    this.hideIcon = false,
  }) : super(key: key);

  final String title;
  final Rx<DateTimeRange> selectedDate;
  final DateTimeRange? initialDate;
  ValueChanged<DateTimeRange>? onChanged;
  bool hideIcon;

  void onChangedHandler(DateTimeRange value) {
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
        selectedDate.value = await showDateRangePicker(
              context: context,
              firstDate: DateTime(2000),
              lastDate: DateTime(2050),
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
                  hintText:
                      "${dateOnlyFormat.format(selectedDate.value.start)} - ${dateOnlyFormat.format(selectedDate.value.end)}",
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

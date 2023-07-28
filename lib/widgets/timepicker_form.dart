import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormTimePicker extends StatelessWidget {
  const FormTimePicker({
    Key? key,
    required this.title,
    required this.selectedTime,
  }) : super(key: key);

  final String title;
  final Rx<TimeOfDay> selectedTime;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        selectedTime.value = await showTimePicker(
                context: context, initialTime: TimeOfDay.now()) ??
            selectedTime.value;
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
                  suffixIcon: const ImageIcon(
                    AssetImage('assets/images/Date.png'),
                    color: Color(0xFF686777),
                    size: 1,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  hintText: selectedTime.value.format(context),
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

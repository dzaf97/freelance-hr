import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myezhr/pages/business_trip/controller.dart';
import 'package:myezhr/pages/business_trip/destination_form.dart';
import 'package:myezhr/widgets/button.dart';
import 'package:myezhr/widgets/dropdown_form.dart';
import 'package:myezhr/widgets/filepicker_form.dart';
import 'package:myezhr/widgets/textfield_form.dart';

class BusinessForm extends GetView<BusinessTripController> {
  const BusinessForm({
    Key? key,
    this.isEdit = false,
  }) : super(key: key);

  final bool isEdit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          "Business Trip",
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.center,
              child: FormDropdown(
                items: controller.tripPurposes,
                title: "Business Trip Type",
                value: controller.selectedTripPurpose,
                // value: controller.selectedTripPurpose,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: FormTextField(
                title: "Remarks",
                controller: controller.remarks,
              ),
            ),
            !isEdit
                ? Align(
                    alignment: Alignment.center,
                    child: FormFilePicker(
                      title: "Attachment",
                      file: controller.attachment,
                    ),
                  )
                : Container(),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              alignment: Alignment.centerRight,
              child: AppButton(
                onPressed: () {
                  if (controller.remarks.text == "") {
                    Get.showSnackbar(
                      GetSnackBar(
                        message: "Please fill in all missing fields",
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        onTap: (snack) => Get.back(),
                        duration: 2.seconds,
                      ),
                    );
                    return;
                  }
                  Get.to(() => DestinationForm(isEdit: isEdit));
                },
                title: "Next",
                width: Get.width * 0.4,
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
              ),
            )
          ],
        ),
      ),
    );
  }
}

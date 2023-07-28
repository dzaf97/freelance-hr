import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myezhr/models/claim/claim_request.dart';
import 'package:myezhr/utils/formatter.dart';
import 'package:myezhr/utils/network.dart';
import 'package:myezhr/utils/theme.dart';
import 'package:myezhr/widgets/button.dart';
import 'package:myezhr/widgets/datepicker_form.dart';
import 'package:myezhr/widgets/dropdown_form.dart';
import 'package:myezhr/widgets/filepicker_form.dart';
import 'package:myezhr/widgets/textfield_form.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ClaimForm extends StatelessWidget {
  const ClaimForm({
    Key? key,
    this.id,
    required this.submitForm,
    required this.cancelClaim,
    required this.claimTypes,
    required this.selectedClaimType,
    required this.selectedDate,
    required this.amount,
    required this.file,
    required this.title,
    required this.remarks,
    this.attachment,
    this.isEdit = false,
  }) : super(key: key);

  final String? id;
  final bool isEdit;
  final Rx<File> file;
  final TextEditingController title;
  final TextEditingController remarks;
  final TextEditingController amount;
  final Rx<DateTime> selectedDate;
  final Rx<DropdownValue> selectedClaimType;
  final List<DropdownValue> claimTypes;
  final Function submitForm;
  final Function cancelClaim;
  final String? attachment;

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
            FormDatePicker(title: "Date", selectedDate: selectedDate),
            FormDropdown(
              items: claimTypes,
              title: "Claim Type",
              value: selectedClaimType,
            ),
            FormTextField(
              controller: title,
              title: "Title",
            ),
            FormTextField(
              controller: remarks,
              title: "Remarks",
            ),
            FormTextField(
              controller: amount,
              title: "Amount",
              keyboardType: TextInputType.number,
            ),
            (attachment != null)
                ? (attachment!.split(".").last == "png" ||
                        attachment!.split(".").last == "jpg")
                    ? Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: Get.height * 0.4,
                          child: Image.network(cloudPath + attachment!),
                        ),
                      )
                    : Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: Get.width * 0.8,
                          height: Get.height * 0.4,
                          child: SfPdfViewer.network(
                            cloudPath + attachment!,
                            pageLayoutMode: PdfPageLayoutMode.single,
                          ),
                        ),
                      )
                : Container(),
            (isEdit)
                ? Container()
                : FormFilePicker(title: "Attachment", file: file),
            Padding(
              padding: const EdgeInsets.only(top: 37),
              child: AppButton(
                width: Get.width * 0.9,
                onPressed: () => submitForm(
                  ClaimRequest(
                    id: id,
                    claimCategoryId: (isEdit)
                        ? null
                        : selectedClaimType.value.value.toString(),
                    claimTypeId:
                        selectedClaimType.value.additionalValue.toString(),
                    date: dateOnlyFormat.format(selectedDate.value),
                    remarks: remarks.text,
                    title: title.text,
                    amountClaimed: amount.text,
                    file: file.value.path,
                  ),
                  isEdit: isEdit,
                ),
                title: (isEdit) ? "Save" : "Submit",
              ),
            ),
            (isEdit)
                ? Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: AppButton(
                      color: AppColor.tertiary,
                      width: Get.width * 0.9,
                      onPressed: () => cancelClaim(id),
                      title: "Delete",
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}

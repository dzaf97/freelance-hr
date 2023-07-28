import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:myezhr/models/claim/claim.dart';
import 'package:myezhr/pages/claim/claim_form.dart';
import 'package:myezhr/pages/claim/controller.dart';
import 'package:myezhr/utils/formatter.dart';
import 'package:myezhr/utils/storage.dart';

class Draft extends StatelessWidget {
  const Draft({
    Key? key,
    required this.listDraftClaim,
  }) : super(key: key);

  final RxList<Claim> listDraftClaim;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: Obx(
          () {
            List<Widget> widgetList = [];
            widgetList.addAll(
              listDraftClaim.map(
                (element) => ClaimHistoryTile(
                  id: element.id.toString(),
                  name: Get.find<Storage>().getUser.name ?? "-",
                  title: element.title ?? "",
                  date: dateOnlyFormat.format(element.date ?? DateTime.now()),
                  moneyClaim:
                      element.amountClaimed?.toStringAsFixed(2) ?? "0.00",
                  status: element.status ?? "",
                  attachment: element.attachmentPath ?? "-",
                  claimType: element.category?.category ?? "",
                  remarks: element.remarks ?? "-",
                  claimTypeId: element.claimTypeId ?? 1,
                ),
              ),
            );

            widgetList
                .add(const Padding(padding: EdgeInsets.only(bottom: 100)));

            return ListView(
              children: widgetList,
            );
          },
        ),
      ),
    );
  }
}

class ClaimHistoryTile extends StatelessWidget {
  const ClaimHistoryTile({
    Key? key,
    required this.id,
    required this.name,
    required this.title,
    required this.moneyClaim,
    required this.date,
    required this.status,
    required this.claimType,
    required this.remarks,
    required this.attachment,
    required this.claimTypeId,
  }) : super(key: key);

  final String id;
  final String name;
  final String title;
  final String moneyClaim;
  final String date;
  final String status;
  final String claimType;
  final String remarks;
  final String attachment;
  final int claimTypeId;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
            leading: statusIcon(status),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title),
                Text(status.capitalizeFirst ?? ""),
              ],
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(moneyClaim),
                Text(date),
              ],
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              var dropdownValue = Get.find<ClaimController>()
                  .claimTypes
                  .where((element) => element.additionalValue == claimTypeId);
              Get.find<ClaimController>().remarks.text = remarks;
              Get.find<ClaimController>().title.text = title;
              Get.find<ClaimController>().file.value = File('');
              Get.find<ClaimController>().amount.text = moneyClaim;
              if (dropdownValue.isNotEmpty) {
                Get.find<ClaimController>().selectedClaimType.value =
                    dropdownValue.first;
              }
              Get.find<ClaimController>().selectedDate.value =
                  DateTime.parse(date);
              Get.bottomSheet(
                ClaimForm(
                  isEdit: true,
                  id: id,
                  attachment: attachment,
                  remarks: Get.find<ClaimController>().remarks,
                  title: Get.find<ClaimController>().title,
                  file: Get.find<ClaimController>().file,
                  amount: Get.find<ClaimController>().amount,
                  selectedDate: Get.find<ClaimController>().selectedDate,
                  selectedClaimType:
                      Get.find<ClaimController>().selectedClaimType,
                  claimTypes: Get.find<ClaimController>().claimTypes,
                  cancelClaim: Get.find<ClaimController>().cancelClaim,
                  submitForm: Get.find<ClaimController>().submitForm,
                ),
                isScrollControlled: true,
              );
            }),
        const Divider(
          height: 0,
          thickness: 1,
        ),
      ],
    );
  }

  Widget statusIcon(String status) {
    switch (status) {
      case "approved":
        return SvgPicture.asset('assets/svg/Claim_approved.svg');
      case "approved_partially":
        return SvgPicture.asset('assets/svg/Claim_approved_partially.svg');
      case "pending":
        return SvgPicture.asset('assets/svg/Claim_pending.svg');
      case "rejected":
        return SvgPicture.asset('assets/svg/Claim_reject.svg');
      case "additational":
        return SvgPicture.asset('assets/svg/Claim_warn.svg');
      default:
        return SvgPicture.asset('assets/svg/Claim_pending.svg');
    }
  }
}

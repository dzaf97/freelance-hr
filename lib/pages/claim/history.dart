import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:myezhr/models/claim/claim.dart';
import 'package:myezhr/pages/claim/claim_summary.dart';
import 'package:myezhr/utils/formatter.dart';
import 'package:myezhr/utils/storage.dart';

class History extends StatelessWidget {
  const History({
    Key? key,
    required this.listClaimHistory,
  }) : super(key: key);

  final RxList<Claim> listClaimHistory;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: Obx(
          () {
            List<Widget> widgetList = [];
            widgetList.addAll(
              listClaimHistory.map(
                (element) => ClaimHistoryTile(
                  id: element.id.toString(),
                  name: Get.find<Storage>().getUser.name ?? "-",
                  title: element.title ?? "",
                  date: dateOnlyFormat
                      .format(element.createdAt ?? DateTime.now()),
                  moneyClaim:
                      element.amountClaimed?.toStringAsFixed(2) ?? "0.00",
                  status: element.status ?? "",
                  attachment: element.attachmentPath ?? "-",
                  claimType: element.category?.category ?? "",
                  remarks: element.remarks ?? "-",
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
          onTap: () => Get.bottomSheet(
            ClaimSummary(
              id: id,
              name: name,
              title: title,
              moneyClaim: moneyClaim,
              date: date,
              status: status,
              claimType: claimType,
              remarks: remarks,
              attachment: attachment,
            ),
            isScrollControlled: true,
          ),
        ),
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

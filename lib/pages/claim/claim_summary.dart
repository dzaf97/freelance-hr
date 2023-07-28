import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myezhr/pages/claim/controller.dart';
import 'package:myezhr/utils/network.dart';
import 'package:myezhr/utils/theme.dart';
import 'package:myezhr/widgets/button.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ClaimSummary extends StatelessWidget {
  const ClaimSummary({
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
    return Container(
      height: Get.height * 0.9,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              backgroundColor: Colors.white,
              elevation: 1,
              title: const Text(
                "Claim Summary",
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
              child: ClaimDetail(
                title: "Requested For",
                detail: name,
              ),
            ),
            ClaimDetail(
              title: "Claim Title",
              detail: title,
            ),
            ClaimDetail(
              title: "Claim Type",
              detail: claimType,
            ),
            Flex(
              direction: Axis.horizontal,
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: ClaimDetail(
                    title: "Date",
                    detail: date,
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: ClaimDetail(
                    title: "Amount",
                    detail: "RM $moneyClaim",
                  ),
                ),
              ],
            ),
            ClaimDetail(
              title: "Remarks",
              detail: remarks,
            ),
            ClaimDetail(
              title: "Attachment",
              detail:
                  (attachment != "-") ? attachment.split("/").last : attachment,
            ),
            (attachment.split(".").last == "pdf")
                ? Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: Get.width * 0.8,
                      height: Get.height * 0.4,
                      child: SfPdfViewer.network(
                        cloudPath + attachment,
                        pageLayoutMode: PdfPageLayoutMode.single,
                      ),
                    ),
                  )
                : Container(),
            (attachment.split(".").last == "png" ||
                    attachment.split(".").last == "jpg")
                ? Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: Get.height * 0.4,
                      child: Image.network(cloudPath + attachment),
                    ),
                  )
                : Container(),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 37),
                child: AppButton(
                  color: const Color(0xFF686777),
                  width: Get.width * 0.9,
                  onPressed: () => Get.find<ClaimController>().cancelClaim(id),
                  title: "Cancel",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ClaimDetail extends StatelessWidget {
  const ClaimDetail({
    Key? key,
    required this.title,
    required this.detail,
  }) : super(key: key);

  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyle().detailTitle,
          ),
          Text(detail),
        ],
      ),
    );
  }
}

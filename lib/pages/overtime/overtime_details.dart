import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:myezhr/models/overtime/overtime.dart';
import 'package:myezhr/utils/formatter.dart';
import 'package:myezhr/utils/network.dart';
import 'package:myezhr/utils/theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class OvertimeDetails extends StatelessWidget {
  const OvertimeDetails({
    Key? key,
    required this.overtimeModel,
  }) : super(key: key);

  final OvertimeModel overtimeModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        elevation: 0,
        title: const Text("Overtime Details"),
      ),
      body: Column(
        children: [Head(overtimeModel: overtimeModel), for (var detail in overtimeModel.details ?? []) OtFormDetail(detail: detail)],
      ),
    );
  }
}

class OtFormDetail extends StatelessWidget {
  const OtFormDetail({
    Key? key,
    required this.detail,
  }) : super(key: key);

  final Detail detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.9,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Text(
              "Details for ${dateMyFormat.format(detail.date)}",
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Flex(
            direction: Axis.horizontal,
            children: [
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: FormDetail(
                  title: 'Start Time',
                  detail: detail.startTime,
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: FormDetail(
                  title: 'End Time',
                  detail: detail.endTime,
                ),
              ),
            ],
          ),
          FormDetail(
            title: 'Duration (hours)',
            detail: detail.duration.toString(),
          ),
        ],
      ),
    );
  }
}

class Head extends StatelessWidget {
  const Head({
    Key? key,
    required this.overtimeModel,
  }) : super(key: key);

  final OvertimeModel overtimeModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.9,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // FormDetail(
          //   title: 'Requested For',
          //   FormDetail: overtimeModel.user?.name ?? "-",
          // ),
          Flex(
            direction: Axis.horizontal,
            children: [
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: FormDetail(
                  title: 'Start Date',
                  detail: dateMyFormat.format(overtimeModel.startDate ?? DateTime.now()),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: FormDetail(
                  title: 'End Date',
                  detail: dateMyFormat.format(overtimeModel.endDate ?? DateTime.now()),
                ),
              ),
            ],
          ),
          FormDetail(
            title: 'Reason',
            detail: overtimeModel.overtimeType.type,
          ),
          FormDetail(
            title: 'Remarks',
            detail: overtimeModel.remarks ?? "-",
          ),
          Flex(
            direction: Axis.horizontal,
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: FormDetail(
                  title: 'Attachment',
                  detail: (overtimeModel.attachmentPath != null) ? overtimeModel.attachmentPath!.split('/').last : "-",
                ),
              ),
              InkWell(
                onTap: () => launchUrlString("$cloudPath${overtimeModel.attachmentPath}"),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(color: AppColor.primary, borderRadius: BorderRadius.circular(10)),
                  child: SvgPicture.asset('assets/svg/Download_white.svg'),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class FormDetail extends StatelessWidget {
  const FormDetail({
    Key? key,
    required this.title,
    required this.detail,
  }) : super(key: key);

  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
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

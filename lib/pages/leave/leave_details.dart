import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myezhr/models/leave/leave.dart';
import 'package:myezhr/pages/leave/controller.dart';
import 'package:myezhr/utils/formatter.dart';
import 'package:myezhr/utils/network.dart';
import 'package:myezhr/utils/theme.dart';
import 'package:myezhr/widgets/button.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class LeaveDetail extends StatelessWidget {
  const LeaveDetail({
    Key? key,
    required this.leave,
    this.revertCancel,
    required this.onCancel,
    required this.delete,
  }) : super(key: key);

  final Leave leave;
  final Function? revertCancel;
  final Function onCancel;
  final Function delete;

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
                "Leave Details",
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
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(border: Border.all(color: const Color(0xFFD1D1D6)), borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flex(
                        direction: Axis.horizontal,
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            child: VerticalDetail(
                              title: 'Leave Type',
                              subTitle: leave.leaveType?.type ?? "-",
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            child: VerticalDetail(
                              title: 'Leave Type',
                              subTitle: leave.leaveType?.type ?? "-",
                            ),
                          )
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(bottom: 10)),
                      Flex(
                        direction: Axis.horizontal,
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            child: VerticalDetail(
                              title: 'Start Date',
                              subTitle: dateMyFormat.format(leave.startDate ?? DateTime.now()),
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            child: VerticalDetail(
                              title: 'End Date',
                              subTitle: dateMyFormat.format(leave.endDate ?? DateTime.now()),
                            ),
                          )
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(bottom: 10)),
                      VerticalDetail(
                        title: 'Remarks',
                        subTitle: leave.remarks ?? "-",
                      ),
                      const Padding(padding: EdgeInsets.only(bottom: 10)),
                      VerticalDetail(
                        title: 'Attachment',
                        subTitle: leave.attachmentPath ?? "-",
                      ),
                      const Padding(padding: EdgeInsets.only(bottom: 10)),
                      (leave.attachmentPath?.split(".").last == "pdf")
                          ? Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: Get.width * 0.8,
                                height: Get.height * 0.4,
                                child: SfPdfViewer.network(
                                  cloudPath + leave.attachmentPath!,
                                  pageLayoutMode: PdfPageLayoutMode.single,
                                ),
                              ),
                            )
                          : Container(),
                      (leave.attachmentPath?.split(".").last == "png" || leave.attachmentPath?.split(".").last == "jpg")
                          ? FutureBuilder(
                              initialData: false,
                              future: Get.find<Network>().checkImage(url: cloudPath + leave.attachmentPath!),
                              builder: (BuildContext context, AsyncSnapshot<bool> imageok) {
                                if (imageok.data!) {
                                  return Image.network(
                                    cloudPath + leave.attachmentPath!,
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            )
                          : Container(),
                    ],
                  ),
                ),
                button(leave.status ?? "")
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget button(String status) {
    switch (status) {
      case "approved":
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 37),
          child: AppButton(
            color: const Color(0xFF686777),
            width: Get.width * 0.9,
            onPressed: onCancel,
            title: "Request to Cancel",
          ),
        );

      // case "pending-cancel":
      //   return Padding(
      //     padding: const EdgeInsets.symmetric(vertical: 37),
      //     child: AppButton(
      //       color: const Color(0xFF686777),
      //       width: Get.width * 0.9,
      //       onPressed: revertCancel,
      //       title: "Cancel Request",
      //     ),
      //   );

      case "pending":
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 37),
          child: AppButton(
            color: const Color(0xFF686777),
            width: Get.width * 0.9,
            onPressed: delete,
            title: "Delete",
          ),
        );
      default:
        return Container();
    }
  }
}

class VerticalDetail extends StatelessWidget {
  const VerticalDetail({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyle().detailTitle,
        ),
        Text(
          subTitle,
        ),
      ],
    );
  }
}

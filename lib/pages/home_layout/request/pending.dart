import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:myezhr/models/request/pending_approval.dart';
import 'package:myezhr/utils/formatter.dart';
import 'package:myezhr/utils/theme.dart';
import 'package:myezhr/widgets/button.dart';
import 'package:myezhr/widgets/textfield_form.dart';

class Pending extends StatelessWidget {
  const Pending({
    Key? key,
    required this.pendingApprovals,
    required this.onPressed,
  }) : super(key: key);

  final RxList<PendingApproval> pendingApprovals;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: Obx(
          () => ListView(
            children: pendingApprovals
                .map((element) => PendingTile(
                      pendingApproval: element,
                      onPressed: onPressed,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

class PendingTile extends StatelessWidget {
  PendingTile({
    Key? key,
    required this.pendingApproval,
    required this.onPressed,
  }) : super(key: key);

  final TextEditingController remarks = TextEditingController();
  final PendingApproval pendingApproval;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.bottomSheet(
        SingleChildScrollView(
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBar(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    title: const Text(
                      "Request Approval",
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
                  VerticalDetail(
                    title: "Requested For",
                    subTitle: pendingApproval.user,
                  ),
                  const SizedBox(height: 20),
                  VerticalDetail(
                    title: "${pendingApproval.label.capitalizeFirst} Type",
                    subTitle: pendingApproval.type,
                  ),
                  const SizedBox(height: 20),
                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: VerticalDetail(
                          title: "Start Date",
                          subTitle:
                              dateFormat.format(pendingApproval.startDate),
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: VerticalDetail(
                          title: "End Date",
                          subTitle: dateFormat.format(pendingApproval.endDate),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  VerticalDetail(
                    title: "Remarks",
                    subTitle: pendingApproval.remarks ?? "-",
                  ),
                  // const SizedBox(height: 20),
                  // (pendingApproval.label == "claim")
                  //     ? VerticalDetail(
                  //         title: "Amount",
                  //         subTitle: pendingApproval,
                  //       )
                  //     : Container(),
                  const SizedBox(height: 20),
                  VerticalDetail(
                    title: "Attachment",
                    subTitle: "N/A",
                  ),
                  (pendingApproval.label == "attendance-correction")
                      ? Container()
                      : Column(
                          children: [
                            const SizedBox(height: 20),
                            FormTextField(
                              autofocus: true,
                              controller: remarks,
                              title: "Approver Remarks",
                            ),
                          ],
                        ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AppButton(
                        onPressed: () => onPressed(
                          pendingApproval,
                          "rejected",
                          remarks.text,
                        ),
                        width: Get.width * 0.4,
                        title: "Reject",
                      ),
                      AppButton(
                        onPressed: () => onPressed(
                          pendingApproval,
                          "approved",
                          remarks.text,
                        ),
                        title: "Approve",
                        width: Get.width * 0.4,
                        color: const Color(0xFF34C759),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        // Scaffold(
        //   resizeToAvoidBottomInset: true,
        //   backgroundColor: Colors.white,
        //   appBar: AppBar(
        //     shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        //     backgroundColor: Colors.white,
        //     elevation: 0,
        //     title: const Text(
        //       "Request Approval",
        //       style: TextStyle(color: Colors.black),
        //     ),
        //     leading: GestureDetector(
        //       onTap: () => Get.back(),
        //       child: const Icon(
        //         Icons.highlight_remove_sharp,
        //         color: Colors.black,
        //       ),
        //     ),
        //   ),
        //   body: SingleChildScrollView(
        //     child: Container(
        //       width: double.infinity,
        //       padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           VerticalDetail(
        //             title: "Requested For",
        //             subTitle: pendingApproval.user,
        //           ),
        //           const SizedBox(height: 20),
        //           VerticalDetail(
        //             title: "${pendingApproval.label.capitalizeFirst} Type",
        //             subTitle: pendingApproval.type,
        //           ),
        //           const SizedBox(height: 20),
        //           Flex(
        //             direction: Axis.horizontal,
        //             children: [
        //               Flexible(
        //                 fit: FlexFit.tight,
        //                 flex: 1,
        //                 child: VerticalDetail(
        //                   title: "Start Date",
        //                   subTitle: dateFormat.format(pendingApproval.startDate),
        //                 ),
        //               ),
        //               Flexible(
        //                 fit: FlexFit.tight,
        //                 flex: 1,
        //                 child: VerticalDetail(
        //                   title: "End Date",
        //                   subTitle: dateFormat.format(pendingApproval.endDate),
        //                 ),
        //               )
        //             ],
        //           ),
        //           const SizedBox(height: 20),
        //           VerticalDetail(
        //             title: "Remarks",
        //             subTitle: pendingApproval.remarks,
        //           ),
        //           const SizedBox(height: 20),
        //           VerticalDetail(
        //             title: "Attachment",
        //             subTitle: "N/A",
        //           ),
        //           const SizedBox(height: 20),
        //           FormTextField(
        //             autofocus: true,
        //             controller: remarks,
        //             title: "Approver Remarks",
        //           ),
        //           const SizedBox(height: 30),
        //           Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceAround,
        //             children: [
        //               AppButton(
        //                 onPressed: () => onPressed(
        //                   pendingApproval,
        //                   "rejected",
        //                   remarks.text,
        //                 ),
        //                 width: Get.width * 0.4,
        //                 title: "Reject",
        //               ),
        //               AppButton(
        //                 onPressed: () => onPressed(
        //                   pendingApproval,
        //                   "approved",
        //                   remarks.text,
        //                 ),
        //                 title: "Approve",
        //                 width: Get.width * 0.4,
        //                 color: const Color(0xFF34C759),
        //               ),
        //             ],
        //           )
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        isScrollControlled: true,
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
        child: Column(
          children: [
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  flex: 0,
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: iconType(pendingApproval.label),
                  ),
                ),
                Flexible(
                  flex: 4,
                  fit: FlexFit.tight,
                  child: Text(
                    pendingApproval.type,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                  decoration: BoxDecoration(
                      color: const Color(0xFFFFCC00),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    pendingApproval.status,
                    style: const TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.only(top: 5),
              alignment: Alignment.centerLeft,
              child: Text(pendingApproval.user),
            ),
            Container(
              padding: const EdgeInsets.only(top: 4),
              alignment: Alignment.centerLeft,
              child: Text(
                pendingApproval.position,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF686777),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: SvgPicture.asset("assets/svg/Calendar-outline.svg",
                        width: 20),
                  ),
                  Text(
                    "${dateFormat.format(pendingApproval.startDate)} - ${dateFormat.format(pendingApproval.endDate)}",
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 11),
                  child: SvgPicture.asset(
                    "assets/svg/Remarks.svg",
                    width: 18,
                  ),
                ),
                Text(pendingApproval.remarks ?? "-")
              ],
            ),
            Row(
              children: [
                const Spacer(),
                Text(
                  dateFormat.format(pendingApproval.applyDate),
                  style: const TextStyle(
                    color: Color(0xFF686777),
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
            const Divider(
              thickness: 1,
            )
          ],
        ),
      ),
    );
  }

  SvgPicture iconType(String requestType) {
    switch (requestType.toLowerCase()) {
      case "claim":
        return SvgPicture.asset("assets/svg/Claim-circle.svg");
      case "leave":
        return SvgPicture.asset("assets/svg/Leave-circle.svg");
      case "attendance-correction":
        return SvgPicture.asset("assets/svg/Attendance-circle.svg");
      case "business":
        return SvgPicture.asset("assets/svg/Business-circle.svg");
      case "overtime":
        return SvgPicture.asset("assets/svg/Ot-circle.svg");
      default:
        return SvgPicture.asset("assets/svg/Claim-circle.svg");
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
          style: AppStyle().detailSubtitle,
        ),
      ],
    );
  }
}

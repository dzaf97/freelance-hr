import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:myezhr/models/overtime/overtime.dart';
import 'package:myezhr/pages/overtime/overtime_details.dart';
import 'package:myezhr/utils/formatter.dart';

class History extends StatelessWidget {
  const History({
    Key? key,
    required this.overtimeHistory,
  }) : super(key: key);

  final RxList<OvertimeModel> overtimeHistory;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: Obx(
          () {
            List<Widget> children = [];
            children = [
              ...overtimeHistory
                  .map(((element) => OtHistoryTile(overtime: element))),
              const SizedBox(height: 150),
            ];
            return SingleChildScrollView(
              child: Column(
                children: children,
              ),
            );
          },
        ),
      ),
    );
  }
}

class OtHistoryTile extends StatelessWidget {
  const OtHistoryTile({
    Key? key,
    required this.overtime,
  }) : super(key: key);

  final OvertimeModel overtime;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () => Get.to(() => OvertimeDetails(overtimeModel: overtime)),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          leading: statusIcon(overtime.status ?? ""),
          title: Column(
            children: [
              Flex(
                direction: Axis.horizontal,
                children: [
                  const Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Text(
                      "From:",
                      style: TextStyle(color: Color(0xFF686777), fontSize: 14),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Text(
                      dateTimeFormat
                          .format(overtime.startDate ?? DateTime.now()),
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(bottom: 5)),
              Flex(
                direction: Axis.horizontal,
                children: [
                  const Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Text(
                      "To:",
                      style: TextStyle(color: Color(0xFF686777), fontSize: 14),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Text(
                      dateTimeFormat.format(overtime.endDate ?? DateTime.now()),
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ],
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
        const Divider(height: 0, thickness: 1),
      ],
    );
  }

  Widget statusIcon(String status) {
    switch (status) {
      case "pending":
        return SvgPicture.asset('assets/svg/Claim_pending.svg');
      case "approved":
        return SvgPicture.asset('assets/svg/Claim_approved.svg');
      case "rejected":
        return SvgPicture.asset('assets/svg/Claim_reject.svg');
      default:
        return SvgPicture.asset('assets/svg/Claim_pending.svg');
    }
  }
}

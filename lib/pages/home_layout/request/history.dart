import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:myezhr/models/request/request_list.dart';
import 'package:myezhr/utils/formatter.dart';

class History extends StatelessWidget {
  const History({
    Key? key,
    required this.histories,
  }) : super(key: key);

  final RxList<RequestList> histories;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: Obx(() {
          var _history = <Widget>[];
          for (var history in histories) {
            _history.add(
              RequestTile(
                history: history,
              ),
            );
          }

          _history.add(const Padding(padding: EdgeInsets.only(bottom: 100)));

          return ListView(children: _history);
        }),
      ),
    );
  }
}

class RequestTile extends StatelessWidget {
  const RequestTile({
    Key? key,
    required this.history,
  }) : super(key: key);

  final RequestList history;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                    child: iconType(history.label ?? ""),
                  ),
                ),
                Flexible(
                  flex: 4,
                  fit: FlexFit.tight,
                  child: Text(
                    history.type ?? "-",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                  decoration: BoxDecoration(color: statusColor(history.status ?? ""), borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    history.status != null ? history.status!.capitalizeFirst! : "-",
                    style: const TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.only(top: 5),
              alignment: Alignment.centerLeft,
              child: Text(history.user),
            ),
            Container(
              padding: const EdgeInsets.only(top: 4),
              alignment: Alignment.centerLeft,
              child: Text(
                history.position,
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
                    child: SvgPicture.asset("assets/svg/Calendar-outline.svg", width: 20),
                  ),
                  Text(
                    "${dateFormat.format(history.startDate ?? DateTime.now())} - ${dateFormat.format(history.endDate ?? DateTime.now())}",
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
                Text(history.remarks ?? "-")
              ],
            ),
            Row(
              children: [
                const Spacer(),
                Text(
                  dateFormat.format(history.applyDate ?? DateTime.now()),
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

  Color statusColor(String status) {
    switch (status.toLowerCase()) {
      case "pending":
        return const Color(0xFFFFCC00);
      case "rejected":
        return const Color(0xFFFF453A);
      case "approved":
        return const Color(0xFF34C759);
      default:
        return const Color(0xFF686777);
    }
  }
}

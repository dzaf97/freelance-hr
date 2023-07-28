import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/state_manager.dart';
import 'package:myezhr/models/attendance/attendance_correction.dart';
import 'package:myezhr/utils/formatter.dart';

class Correction extends StatelessWidget {
  const Correction({
    Key? key,
    required this.attendanceCorrections,
  }) : super(key: key);

  final RxList<AttendanceCorrection> attendanceCorrections;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: Obx(
          (() {
            List<Widget> children = <Widget>[];
            children.addAll(
              attendanceCorrections.map(
                (element) => CorrectionBox(
                  status: element.status,
                  date: dateFormat.format(element.date),
                  message: element.remarks,
                  submitDate: dateTimeFormat.format(element.createdAt),
                ),
              ),
            );

            children.add(const Padding(padding: EdgeInsets.only(bottom: 70)));
            return ListView(
              children: children,
            );
          }),
        ),
      ),
    );
  }
}

class CorrectionBox extends StatelessWidget {
  const CorrectionBox({
    Key? key,
    required this.date,
    required this.message,
    required this.submitDate,
    required this.status,
  }) : super(key: key);

  final String date;
  final String message;
  final String submitDate;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 5,
              offset: const Offset(2, 5),
            )
          ],
          color: const Color(0xFFF2F2F7),
          border: Border.all(
            color: const Color(0xFFD1D1D6),
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15.0),
              decoration: const BoxDecoration(
                  border: Border(
                bottom: BorderSide(color: Color(0xFFD1D1D6)),
              )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Correction for $date",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SvgPicture.asset('assets/svg/Dots.svg')
                ],
              )),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            width: double.infinity,
            height: 70,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
            ),
            child: Stack(
              children: [
                Positioned(top: 5, child: statusIcon(status)),
                Positioned(
                  left: 50,
                  top: 5,
                  child: Text(
                    message,
                    style: const TextStyle(
                      color: Color(0xFF636366),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 3,
                  child: Text(
                    "Submitted at $submitDate",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF636366),
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
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
        return SvgPicture.asset('assets/svg/Claim_reject.svg');
    }
  }
}

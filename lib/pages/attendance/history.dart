import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myezhr/pages/attendance/controller.dart';
import 'package:myezhr/widgets/attendance_box.dart';

class History extends StatelessWidget {
  const History({
    Key? key,
    required this.attendanceRecords,
  }) : super(key: key);

  final RxList<AttendanceRecord> attendanceRecords;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: Obx(
          () => ListView(
            children: attendanceRecords
                .map(
                  (element) => AttendanceBox(
                      date: element.date,
                      startTime: element.startTime,
                      endTime: element.endTime,
                      attachmentIn: element.attachmentIn,
                      attachmentOut: element.attachmentOut),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

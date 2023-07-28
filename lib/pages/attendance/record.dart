import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:myezhr/pages/attendance/controller.dart';
import 'package:myezhr/utils/network.dart';
import 'package:myezhr/utils/storage.dart';
import 'package:myezhr/utils/theme.dart';
import 'package:myezhr/widgets/attendance_box.dart';

class Record extends StatelessWidget {
  const Record({
    Key? key,
    required this.attendanceRecords,
    required this.isLoading,
    required this.name,
    required this.todayShift,
    required this.today,
  }) : super(key: key);

  final RxString name;
  final RxString todayShift;
  final RxString today;
  final RxBool isLoading;
  final RxList<AttendanceRecord> attendanceRecords;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          TodayAttendance(
            name: name,
            today: today,
            todayShift: todayShift,
            url: Get.find<Storage>().getUser.photoUrl,
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: const Text(
              "Your recent attendance",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 10),
              color: Colors.white,
              child: Obx(
                () => (isLoading.value)
                    ? Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        margin: const EdgeInsets.only(bottom: 150),
                        child: const Center(
                          child: LinearProgressIndicator(),
                        ),
                      )
                    : ListView(
                        children: attendanceRecords
                            .map(
                              (element) => AttendanceBox(
                                date: element.date,
                                startTime: element.startTime,
                                endTime: element.endTime,
                                attachmentIn: element.attachmentIn,
                                attachmentOut: element.attachmentOut,
                              ),
                            )
                            .toList()
                            .getRange(
                              0,
                              (attendanceRecords.length > 2)
                                  ? 3
                                  : attendanceRecords.length,
                            )
                            .toList(),
                      ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TodayAttendance extends StatelessWidget {
  const TodayAttendance({
    Key? key,
    this.url,
    required this.name,
    required this.todayShift,
    required this.today,
  }) : super(key: key);

  final RxString name;
  final RxString todayShift;
  final RxString today;
  final String? url;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: AppColor.primary, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(10, 30, 10, 30),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 40,
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: ClipOval(
                  child: (url != null)
                      ? Image.network("$cloudPath$url")
                      : Image.asset('assets/images/DP.png'),
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Text(
                  name.value,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                todayShift.value,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              Text(
                today.value,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

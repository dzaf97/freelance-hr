import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myezhr/pages/leave/controller.dart';

class Balance extends StatelessWidget {
  const Balance({
    Key? key,
    required this.isLoading,
    required this.leaveBalances,
  }) : super(key: key);

  final RxBool isLoading;
  final RxList<LeaveBalance> leaveBalances;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
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
                  children: leaveBalances
                      .map((element) => LeaveTypeBalance(
                          leaveType: element.leaveType,
                          totalLeave: element.totalLeave,
                          usedLeave: element.usedLeave))
                      .toList(),
                ),
        ),
      ),
    );
  }
}

class LeaveTypeBalance extends StatelessWidget {
  const LeaveTypeBalance({
    Key? key,
    required this.leaveType,
    required this.totalLeave,
    required this.usedLeave,
  }) : super(key: key);

  final String leaveType;
  final num totalLeave;
  final num usedLeave;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                leaveType,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: LinearProgressIndicator(
                value: (totalLeave != 0) ? usedLeave / totalLeave : 0,
                minHeight: 10,
                backgroundColor: const Color(0xFFE2E3E4),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$usedLeave days",
              ),
              Text("$totalLeave days"),
            ],
          ),
          const Divider(
            thickness: 1,
          )
        ],
      ),
    );
  }
}

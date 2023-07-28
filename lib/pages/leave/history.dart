import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myezhr/models/leave/leave.dart';
import 'package:myezhr/pages/leave/controller.dart';
import 'package:myezhr/pages/leave/leave_details.dart';
import 'package:myezhr/utils/formatter.dart';
import 'package:myezhr/utils/storage.dart';

class History extends GetView<LeaveController> {
  const History({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: Obx(() {
          var leaves = <Widget>[];
          for (var leave in controller.storeLeaves) {
            leaves.add(
              GestureDetector(
                onTap: () => Get.bottomSheet(
                  LeaveDetail(
                    leave: leave,
                    // revertCancel: () => controller.revertCancel(leave),
                    onCancel: () => controller.cancelLeave(leave),
                    delete: () => controller.deleteLeave(leave),
                  ),
                  isScrollControlled: true,
                ),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            leave.leaveType?.type ?? "-",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            dateFormat
                                .format(leave.createdAt ?? DateTime.now()),
                            style: const TextStyle(color: Color(0xFF686777)),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Image.asset(
                                  'assets/images/Calendar_history.png'),
                            ),
                            Text(
                              "${dateFormat.format(leave.startDate ?? DateTime.now())} - ${dateFormat.format(leave.endDate ?? DateTime.now())}",
                              style: const TextStyle(color: Color(0xFF686777)),
                            ),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 25),
                              decoration: BoxDecoration(
                                  color: statusColor(leave.status ?? "Pending"),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                leave.status!.capitalizeFirst ?? "-",
                                style: const TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 11),
                            child: Image.asset(
                              'assets/images/Person_history.png',
                              scale: 0.95,
                            ),
                          ),
                          Text(
                            Get.find<Storage>().getUser.name ?? "-",
                            style: const TextStyle(color: Color(0xFF686777)),
                          )
                        ],
                      ),
                      const Divider(
                        thickness: 1,
                      )
                    ],
                  ),
                ),
              ),
            );
          }
          leaves.add(const Padding(padding: EdgeInsets.only(bottom: 100)));
          return ListView(children: leaves);
        }),
      ),
    );
  }

  Color statusColor(String status) {
    switch (status.toLowerCase()) {
      case "pending":
        return const Color(0xFFFFCC00);
      case "rejected":
        return const Color(0xFFFF453A);
      case "approved":
        return const Color(0xFF34C759);
      case "cancel":
        return Colors.grey;
      default:
        return Colors.grey;
    }
  }
}

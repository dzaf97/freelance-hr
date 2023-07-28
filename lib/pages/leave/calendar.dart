import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:myezhr/pages/leave/controller.dart';

class Calendar extends StatelessWidget {
  const Calendar({
    Key? key,
    required this.leaveCalendars,
    required this.onDateSelected,
  }) : super(key: key);

  final RxList<LeaveCalendar> leaveCalendars;
  final Function(DateTime) onDateSelected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: const EdgeInsets.only(bottom: 5),
            child: CalendarTimeline(
              initialDate: DateTime.now(),
              firstDate: DateTime(2019, 1, 15),
              lastDate: DateTime(2023, 11, 20),
              onDateSelected: (date) => onDateSelected(date),
            ),
          ),
          const Divider(
            thickness: 2,
            indent: 15,
            endIndent: 15,
          ),
          Expanded(
            child: Obx(() {
              var calendars = <Widget>[];
              for (var leaveCalendar in leaveCalendars) {
                calendars.add(
                  CalendarListTile(
                    title: leaveCalendar.title,
                    status: leaveCalendar.status,
                    name: leaveCalendar.name,
                  ),
                );
              }

              if (leaveCalendars.isEmpty) {
                calendars.add(Image.asset('assets/images/EmptyState.png'));
              } else {
                calendars
                    .add(const Padding(padding: EdgeInsets.only(bottom: 100)));
              }

              return Container(
                color:
                    leaveCalendars.isEmpty ? Colors.transparent : Colors.white,
                child: ListView(children: calendars),
              );
            }),
          )
        ],
      ),
    );
  }
}

class CalendarListTile extends StatelessWidget {
  const CalendarListTile({
    Key? key,
    required this.title,
    required this.status,
    required this.name,
  }) : super(key: key);

  final String title;
  final String status;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                  decoration: BoxDecoration(
                      color: statusColor(status),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    status,
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
                name,
                style: const TextStyle(color: Color(0xFF686777)),
              )
            ],
          ),
          const Divider(
            thickness: 1,
          )
        ],
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
      default:
        return const Color(0xFF34C759);
    }
  }
}

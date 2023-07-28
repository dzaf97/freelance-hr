import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:myezhr/pages/overtime/controller.dart';
import 'package:myezhr/utils/formatter.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget {
  const Calendar({
    Key? key,
    required this.focusedDay,
    required this.scrollController,
    required this.onDaySelected,
    required this.overtimeTeammates,
  }) : super(key: key);

  final ScrollController scrollController;
  final Rx<DateTime> focusedDay;
  final Function onDaySelected;
  final RxList<OvertimeData> overtimeTeammates;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xFFD1D1D6)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Obx(
                () => TableCalendar(
                  headerStyle: const HeaderStyle(titleCentered: true),
                  availableCalendarFormats: const {
                    CalendarFormat.month: 'Month'
                  },
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: focusedDay.value,
                  currentDay: focusedDay.value,
                  calendarFormat: CalendarFormat.month,
                  onDaySelected: (selectedDay, _focusedDay) =>
                      onDaySelected(selectedDay, _focusedDay),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  "Teammates Overtime",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 120),
              color: Colors.white,
              child: Obx(
                () {
                  List<Widget> overtimes = [];
                  overtimes = [
                    ...overtimeTeammates
                        .where((p0) =>
                            dateFormat.format(p0.createdAt) ==
                            dateFormat.format(focusedDay.value))
                        .map(
                          (element) => OvertimeTile(
                            name: element.name,
                            status: element.status,
                            startTime: element.startTime,
                            endTime: element.endTime,
                          ),
                        )
                  ];
                  return Column(
                    children: overtimes,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OvertimeTile extends StatelessWidget {
  const OvertimeTile({
    Key? key,
    required this.name,
    required this.status,
    required this.startTime,
    required this.endTime,
  }) : super(key: key);

  final String name;
  final String status;
  final String startTime;
  final String endTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: statusIcon(status),
          title: Text(name),
          subtitle: Text("$startTime - $endTime"),
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

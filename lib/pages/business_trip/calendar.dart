import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myezhr/models/business_trip/business_trip.dart';
import 'package:myezhr/pages/business_trip/history.dart';
import 'package:myezhr/utils/formatter.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget {
  const Calendar({
    Key? key,
    required this.focusedDay,
    required this.scrollController,
    required this.onDaySelected,
    required this.trips,
  }) : super(key: key);

  final ScrollController scrollController;
  final Rx<DateTime> focusedDay;
  final Function onDaySelected;
  final RxList<BusinessTrip> trips;

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
                  "Business Trip",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 120),
              color: Colors.white,
              child: Obx(
                () {
                  List<Widget> tripsList = [];
                  tripsList = [
                    ...trips
                        .where((p0) =>
                            dateFormat.format(p0.createdAt!) ==
                            dateFormat.format(focusedDay.value))
                        .map(
                          (element) => HistoryTile(
                            trip: element,
                          ),
                        )
                  ];
                  return Column(
                    children: tripsList,
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

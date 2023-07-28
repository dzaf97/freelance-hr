import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:myezhr/models/business_trip/business_trip.dart';
import 'package:myezhr/pages/business_trip/trip_detail.dart';
import 'package:myezhr/utils/formatter.dart';

class History extends StatelessWidget {
  const History({
    Key? key,
    required this.tripHistory,
  }) : super(key: key);

  final RxList<BusinessTrip> tripHistory;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Obx(
            () {
              List<Widget> children = [];
              children = [
                ...tripHistory.map(((element) => HistoryTile(trip: element)))
              ];
              return Column(
                children: children,
              );
            },
          ),
        ),
      ),
    );
  }
}

class HistoryTile extends StatelessWidget {
  const HistoryTile({
    Key? key,
    required this.trip,
  }) : super(key: key);

  final BusinessTrip trip;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () => Get.to(() => BusinessTripDetails(trip: trip)),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          leading: statusIcon(trip.status!),
          title: Column(
            children: [
              for (var destination in trip.destinations!)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      destination.destination?.text ?? "-",
                      style: const TextStyle(fontSize: 15),
                    ),
                    Row(
                      children: [
                        Text(
                          "${dateFormat.format(destination.startDate?.value ?? DateTime.now())} - ",
                          style:
                              const TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 5)),
                        Text(
                          dateFormat.format(
                              destination.endDate?.value ?? DateTime.now()),
                          style:
                              const TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                  ],
                )
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myezhr/models/business_trip/business_trip.dart';
import 'package:myezhr/models/business_trip/destination.dart';
import 'package:myezhr/pages/business_trip/controller.dart';
import 'package:myezhr/utils/formatter.dart';
import 'package:myezhr/utils/network.dart';
import 'package:myezhr/utils/storage.dart';
import 'package:myezhr/utils/theme.dart';
import 'package:myezhr/widgets/button.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class BusinessTripDetails extends GetView<BusinessTripController> {
  const BusinessTripDetails({
    Key? key,
    required this.trip,
  }) : super(key: key);

  final BusinessTrip trip;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        elevation: 0,
        title: const Text("Business Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Head(trip: trip),
            TripDestinantions(destinations: trip.destinations ?? []),
            AppButton(
              onPressed: () => controller.editTrip(trip),
              title: "Edit Business Trip",
              width: Get.width * 0.4,
            )
            // for (var detail in overtimeModel.details ?? [])
            //   OtFormDetail(detail: detail)
          ],
        ),
      ),
    );
  }
}

class TripDestinantions extends StatelessWidget {
  const TripDestinantions({
    Key? key,
    required this.destinations,
  }) : super(key: key);

  final List<Destination> destinations;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 15, 0, 0),
          child: Text(
            "Destinations",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        for (var destination in destinations)
          Container(
            width: Get.width * 0.9,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  destination.destination?.text ?? "-",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: FormDetail(
                        title: 'Start Time',
                        detail: dateFormat.format(
                            destination.startDate?.value ?? DateTime.now()),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: FormDetail(
                        title: 'End Time',
                        detail: dateFormat.format(
                            destination.endDate?.value ?? DateTime.now()),
                      ),
                    ),
                  ],
                ),
                FormDetail(
                  title: 'Duration (days)',
                  detail: (destination.endDate!.value
                              .difference(destination.startDate!.value)
                              .inDays +
                          1)
                      .toString(),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class Head extends StatelessWidget {
  const Head({
    Key? key,
    required this.trip,
  }) : super(key: key);

  final BusinessTrip trip;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.9,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormDetail(
            title: 'Requested For',
            detail: Get.find<Storage>().getName,
          ),
          FormDetail(
            title: 'Business Trip Type',
            detail: trip.type ?? "-",
          ),
          FormDetail(
            title: 'Remarks',
            detail: trip.remarks ?? "-",
          ),
          (trip.attachmentPath != null)
              ? (trip.attachmentPath!.split(".").last == "pdf")
                  ? Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: Get.width * 0.8,
                        height: Get.height * 0.4,
                        child: SfPdfViewer.network(
                          cloudPath + trip.attachmentPath!,
                          pageLayoutMode: PdfPageLayoutMode.single,
                        ),
                      ),
                    )
                  : Container()
              : Container(),
          (trip.attachmentPath != null)
              ? (trip.attachmentPath!.split(".").last == "png" ||
                      trip.attachmentPath!.split(".").last == "jpg")
                  ? Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: Get.height * 0.4,
                        child: Image.network(cloudPath + trip.attachmentPath!),
                      ),
                    )
                  : Container()
              : Container(),
        ],
      ),
    );
  }
}

class FormDetail extends StatelessWidget {
  const FormDetail({
    Key? key,
    required this.title,
    required this.detail,
  }) : super(key: key);

  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyle().detailTitle,
          ),
          Text(detail),
        ],
      ),
    );
  }
}

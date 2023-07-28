import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myezhr/models/business_trip/destination.dart';
import 'package:myezhr/pages/business_trip/controller.dart';
import 'package:myezhr/utils/theme.dart';
import 'package:myezhr/widgets/button.dart';
import 'package:myezhr/widgets/daterangepicker_form.dart';
import 'package:myezhr/widgets/textfield_form.dart';
import 'package:uuid/uuid.dart';

class DestinationForm extends GetView<BusinessTripController> {
  const DestinationForm({Key? key, this.isEdit = false}) : super(key: key);

  final bool isEdit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          "Business Trip",
          style: TextStyle(color: Colors.black),
        ),
        leading: GestureDetector(
          onTap: () {
            controller.destinations.clear();
            Get.back();
          },
          child: const Icon(
            Icons.highlight_remove_sharp,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Destinations",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: () => controller.destinations.add(
                      Destination(
                        uuid: const Uuid().v4(),
                        destination: TextEditingController(),
                        startDate: Rx<DateTime>(DateTime.now()),
                        endDate: Rx<DateTime>(DateTime.now()),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: AppColor.tertiary,
                          borderRadius: BorderRadius.circular(15)),
                      child: const Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Obx(
              () => Column(
                children: controller.destinations
                    .map((element) => DestinationDetail(destination: element))
                    .toList(),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: AppButton(
                    onPressed: () {
                      controller.destinations.clear();
                      Get.back();
                    },
                    color: AppColor.tertiary,
                    title: "Back",
                    width: Get.width * 0.4,
                    contentPadding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: AppButton(
                    // onPressed: () => print(isEdit),
                    onPressed: () {
                      controller.saveTrip(isEdit: isEdit);
                    },
                    title: "Save",
                    width: Get.width * 0.4,
                    contentPadding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DestinationDetail extends GetView<BusinessTripController> {
  const DestinationDetail({
    Key? key,
    required this.destination,
  }) : super(key: key);

  final Destination destination;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Destination",
                style: AppStyle().detailTitle,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () => controller.destinations
                    .removeWhere((element) => element.uuid == destination.uuid),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Icon(
                    Icons.delete_outline,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          FormTextField(
            controller: destination.destination!,
            title: "",
            padding: EdgeInsets.zero,
          ),
          Row(
            children: [
              Expanded(
                child: FormDateRangePicker(
                  title: "Date",
                  selectedDate: Rx<DateTimeRange>(
                    DateTimeRange(
                      start: destination.startDate!.value,
                      end: destination.endDate!.value,
                    ),
                  ),
                  onChanged: (value) {
                    destination.startDate!.value = value.start;
                    destination.endDate!.value = value.end;
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

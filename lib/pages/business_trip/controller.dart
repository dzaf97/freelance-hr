import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myezhr/models/business_trip/business_trip.dart';
import 'package:myezhr/models/business_trip/destination.dart';
import 'package:myezhr/pages/business_trip/business_form.dart';
import 'package:myezhr/repositories/business_repo.dart';
import 'package:myezhr/widgets/dropdown_form.dart';

class BusinessTripController extends GetxController {
  // Dependency Injected
  final businessTripRepo = BusinessRepo();

  // UI variable
  final ScrollController scrollController = ScrollController();
  var selectedTab = 0.obs;
  var isLoading = true.obs;
  var focusedDay = DateTime.now().obs;
  var history = <BusinessTrip>[].obs;

  // Form Variable
  var page = 1.obs;
  var tripPurposes = <DropdownValue>[];
  var destinations = <Destination>[].obs;
  Rx<DropdownValue?>? selectedTripPurpose;
  var attachment = File("").obs;
  TextEditingController remarks = TextEditingController();
  int editTripId = 0;

  @override
  void onInit() async {
    super.onInit();
    setup();
  }

  void setup() async {
    history.value = await businessTripRepo.getBusinessTrip();
    var tripPurposes = await businessTripRepo.getTripPurpose();
    this.tripPurposes = tripPurposes
        .map((e) => DropdownValue(name: e.name, value: e.id))
        .toList();
    selectedTripPurpose = Rx(this.tripPurposes.first);
  }

  void saveTrip({bool isEdit = false}) async {
    if (destinations.isEmpty) {
      Get.showSnackbar(
        GetSnackBar(
          message: "Please add at least one destination",
          margin: const EdgeInsets.symmetric(horizontal: 10),
          onTap: (snack) => Get.back(),
          duration: 2.seconds,
        ),
      );
      return;
    }

    for (var destination in destinations) {
      if (destination.destination!.text == "") {
        Get.showSnackbar(
          GetSnackBar(
            message: "Please fill in all missing fields",
            margin: const EdgeInsets.symmetric(horizontal: 10),
            onTap: (snack) => Get.back(),
            duration: 2.seconds,
          ),
        );
        return;
      }
    }

    BusinessTrip request = BusinessTrip(
      remarks: remarks.text,
      attachmentPath: attachment.value.absolute.path,
      destinations: destinations,
      type: selectedTripPurpose?.value?.name ?? "",
    );

    if (isEdit) {
      request.id = editTripId;
      await businessTripRepo.editTrip(request);
      Get.back();
      Get.back();
      Get.back();
    } else {
      await businessTripRepo.postTrip(request);
      Get.back();
      Get.back();
    }
    destinations.clear();
    attachment = File("").obs;
    remarks.clear();
    setup();
  }

  editTrip(BusinessTrip trip) {
    selectedTripPurpose!.value =
        tripPurposes.firstWhere((element) => element.name == trip.type);

    for (var destiation in trip.destinations!) {
      destinations.add(destiation);
    }
    editTripId = trip.id!;
    log("Edit trip Id: $editTripId");
    remarks.text = trip.remarks ?? "";
    Get.to(
      () => const BusinessForm(
        isEdit: true,
      ),
    );
  }

  void onDaySelected(DateTime selectedDay, DateTime _focusedDay) {
    focusedDay.value = _focusedDay;
  }
}

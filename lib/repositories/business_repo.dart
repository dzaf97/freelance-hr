import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:myezhr/models/business_trip/business_trip.dart';
import 'package:myezhr/models/business_trip/trip_purpose.dart';
import 'package:myezhr/utils/formatter.dart';
import 'package:myezhr/utils/network.dart';

class BusinessRepo {
  Network network = Get.find();

  Future<List<BusinessTrip>> getBusinessTrip() async {
    NetworkMsg response = await network.get(url: '/trip');
    log(response.data.toString());
    if (response.success) {
      List<dynamic> raw = response.data["data"] as List;
      return [...raw.map((e) => BusinessTrip.fromJson(e))];
    } else {
      return [];
    }
  }

  Future<List<TripPurpose>> getTripPurpose() async {
    NetworkMsg response = await network.get(url: '/purpose-type');
    log(response.data.toString());
    if (response.success) {
      List<dynamic> raw = response.data["data"] as List;
      return [...raw.map((e) => TripPurpose.fromJson(e))];
    } else {
      return [];
    }
  }

  Future<dynamic> postTrip(BusinessTrip request) async {
    var jsonRequest = {
      "type": request.type,
      "remarks": request.remarks,
      "file": request.attachmentPath,
    };

    for (var i = 0; i < request.destinations!.length; i++) {
      var startDate = {
        "destinations[$i][start_date]":
            dateOnlyFormat.format(request.destinations![i].startDate!.value)
      };
      var endDate = {
        "destinations[$i][end_date]":
            dateOnlyFormat.format(request.destinations![i].endDate!.value)
      };
      var destName = {
        "destinations[$i][destination]":
            request.destinations![i].destination!.text
      };
      jsonRequest.addEntries(startDate.entries);
      jsonRequest.addEntries(endDate.entries);
      jsonRequest.addEntries(destName.entries);
    }

    log(jsonRequest.toString());

    NetworkMsg response = await network.post(url: '/trip', body: jsonRequest);
    if (response.success) {
      log(response.data.toString());
      return null;
    } else {
      return null;
    }
  }

  Future<dynamic> editTrip(BusinessTrip request) async {
    var jsonRequest = {
      "type": request.type,
      "remarks": request.remarks,
      // "file": request.attachmentPath,
    };

    if (request.destinations != null) {
      for (var i = 0; i < request.destinations!.length; i++) {
        var startDate = {
          "destinations[$i][start_date]":
              dateOnlyFormat.format(request.destinations![i].startDate!.value)
        };
        var endDate = {
          "destinations[$i][end_date]":
              dateOnlyFormat.format(request.destinations![i].endDate!.value)
        };
        var destName = {
          "destinations[$i][destination]":
              request.destinations![i].destination!.text
        };
        jsonRequest.addEntries(startDate.entries);
        jsonRequest.addEntries(endDate.entries);
        jsonRequest.addEntries(destName.entries);
      }
    }

    log(jsonEncode(jsonRequest));
    log(request.id.toString());

    NetworkMsg response = await network.put(
        url: '/trip/${request.id}',
        body: jsonRequest,
        headers: {"Content-Type": "application/x-www-form-urlencoded"});
    if (response.success) {
      log("Raw data: ${jsonEncode(response.data)}");
      return BusinessTripRes.fromJson(response.data);
    } else {
      return BusinessTripRes(
        success: response.success,
        data: null,
        message: [response.message.first ?? ""],
        count: 0,
      );
    }
  }

  // Future<OvertimeRequestModel> updateOvertime(
  //     OvertimeRequest request, String id) async {
  //   NetworkMsg response =
  //       await network.put(url: '/overtime/$id', body: request.toJson());
  //   log("Raw Data: ${jsonEncode(response.data)}", name: "Overtime");
  //   if (response.success) {
  //     return OvertimeRequestModel.fromJson(response.data);
  //   } else {
  //     return OvertimeRequestModel.fromJson(response.data);
  //   }
  // }
}

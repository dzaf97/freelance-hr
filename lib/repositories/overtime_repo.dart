import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:myezhr/models/overtime/overtime.dart';
import 'package:myezhr/models/overtime/overtime_request.dart';
import 'package:myezhr/utils/network.dart';

class OvertimeRepo {
  Network network = Get.find();

  Future<List<OvertimeModel>> getOvertimeTeammates() async {
    NetworkMsg response = await network.get(url: '/overtime-teammates');
    if (response.success) {
      List<dynamic> raw = response.data["data"] as List;
      return [...raw.map((e) => OvertimeModel.fromJson(e))];
    } else {
      return [];
    }
  }

  Future<List<OvertimeModel>> getOvertime() async {
    NetworkMsg response = await network.get(url: '/overtime');
    if (response.success) {
      List<dynamic> raw = response.data["data"] as List;
      return [...raw.map((e) => OvertimeModel.fromJson(e))];
    } else {
      return [];
    }
  }

  Future<List<OvertimeType>> getOvertimeType() async {
    NetworkMsg response = await network.get(url: '/overtime-type');
    if (response.success) {
      List<dynamic> raw = response.data["data"] as List;
      return [...raw.map((e) => OvertimeType.fromJson(e))];
    } else {
      return [];
    }
  }

  Future<OvertimeRequestModel> postOvertime(OvertimeRequest request) async {
    NetworkMsg response =
        await network.post(url: '/overtime', body: request.toJson());
    if (response.success) {
      return OvertimeRequestModel.fromJson(response.data);
    } else {
      return OvertimeRequestModel.fromJson(response.data);
    }
  }

  Future<OvertimeRequestModel> updateOvertime(
      OvertimeRequest request, String id) async {
    NetworkMsg response =
        await network.put(url: '/overtime/$id', body: request.toJson());
    log("Raw Data: ${jsonEncode(response.data)}", name: "Overtime");
    if (response.success) {
      return OvertimeRequestModel.fromJson(response.data);
    } else {
      return OvertimeRequestModel.fromJson(response.data);
    }
  }
}

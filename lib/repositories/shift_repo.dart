import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:myezhr/models/shift/shift.dart';
import 'package:myezhr/models/shift/shift_daily.dart';
import 'package:myezhr/utils/network.dart';
import 'package:myezhr/utils/storage.dart';

class ShiftRepo {
  // final box = GetStorage();
  Network network = Get.find();

  Future<Shift?> getShiftSchedule(String date) async {
    NetworkMsg response =
        await network.get(url: '/shift-schedule', queryParams: {"date": date});
    log("getShiftSchedule response ${jsonEncode(response.data)}",
        name: "ShiftRepo");
    if (response.success) {
      if (response.data["data"] != null) {
        Shift parseModel = Shift.fromJson(response.data["data"]);
        Get.find<Storage>().setShift = parseModel;
        return parseModel;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  Future<List<ShiftDaily>> getShiftDaily() async {
    NetworkMsg response = await network.get(url: '/shift-daily');
    if (response.success) {
      List raw = response.data["data"];
      return raw.map((e) => ShiftDaily.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}

import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:myezhr/models/attendance/attendance.dart';
import 'package:myezhr/models/attendance/attendance_correction.dart';
import 'package:myezhr/models/attendance/request.dart';
import 'package:myezhr/utils/formatter.dart';
import 'package:myezhr/utils/network.dart';

class AttendanceRepo {
  Network network = Get.find();

  Future<List<Attendance>> getAttendance({DateTime? date}) async {
    Map<String, String>? query;
    if (date != null) {
      query = {"date": dateOnlyFormat.format(date)};
    }
    NetworkMsg response =
        await network.get(url: '/attendance', queryParams: query);

    log("getAttendance :: ${jsonEncode(response.data)}", name: "Attendance");
    if (response.success) {
      if (date == null) {
        List<dynamic> raw = response.data["data"] as List;
        return [...raw.map((e) => Attendance.fromJson(e))];
      }

      if (jsonEncode(response.data["data"])[0] == "[") {
        List<dynamic> raw = response.data["data"] as List;
        return [...raw.map((e) => Attendance.fromJson(e))];
      } else if (jsonEncode(response.data["data"])[0] == "{") {
        return [Attendance.fromJson(response.data["data"])];
      } else {
        List<dynamic> raw = response.data["data"] as List;
        return [...raw.map((e) => Attendance.fromJson(e))];
      }
    } else {
      return [];
    }
  }

  Future<List<Attendance>> getIncompleteAttendance() async {
    NetworkMsg response = await network.get(url: '/attendance/incomplete');
    log("getIncompleteAttendance :: ${jsonEncode(response.data)}",
        name: "Attendance");
    if (response.success) {
      if (response.data["data"].toString().startsWith('[')) {
        List<dynamic> raw = response.data["data"] as List;
        return [...raw.map((e) => Attendance.fromJson(e))];
      } else {
        return [Attendance.fromJson(response.data["data"])];
      }
    } else {
      return [];
    }
  }

  Future<List<AttendanceCorrection>> getAttendanceCorrection() async {
    NetworkMsg response = await network.get(url: '/attendance-correction');
    log("getAttendanceCorrection :: ${jsonEncode(response.data)}",
        name: "Attendance");
    if (response.success) {
      List<dynamic> raw = response.data["data"] as List;
      return [...raw.map((e) => AttendanceCorrection.fromJson(e))];
    } else {
      return [];
    }
  }

  Future<AttendanceRes> postAttendance(AttendanceRequest request) async {
    log("postAttendance request :: ${jsonEncode(request)}", name: "Attendance");
    NetworkMsg response =
        await network.post(url: '/attendance', body: request.toJson());
    log("postAttendance :: ${jsonEncode(response.data)}", name: "Attendance");
    if (response.success) {
      return AttendanceRes.fromJson(response.data);
    } else {
      return AttendanceRes(
        success: response.success,
        data: null,
        message: response.message,
        count: 0,
      );
    }
  }

  Future<AttendanceRes> updateAttendance(
      AttendanceRequest request, String attendanceId) async {
    NetworkMsg response = await network.post(
        url: '/attendance/$attendanceId', body: request.toJson());
    if (response.success) {
      return AttendanceRes.fromJson(response.data);
    } else {
      return AttendanceRes(
        success: response.success,
        data: null,
        message: response.message,
        count: 0,
      );
    }
  }

  Future<AttendanceCorrectionRes> postAttendanceCorrection(
      AttendanceCorrectionRequest request) async {
    NetworkMsg response = await network.post(
        url: '/attendance-correction', body: request.toJson());
    log("postAttendanceCorrection :: ${jsonEncode(response.data)}",
        name: "Attendance");
    if (response.success) {
      return AttendanceCorrectionRes.fromJson(response.data);
    } else {
      return AttendanceCorrectionRes(
        success: response.success,
        data: null,
        message: response.message,
        count: 0,
      );
    }
  }

  Future<AttendanceCorrectionRes> updateAttendanceCorrection(
      AttendanceCorrectionRequest request, String id) async {
    log(jsonEncode(request), name: "Attendance");
    NetworkMsg response = await network.put(
        url: '/attendance-correction/$id', body: request.toJson());
    if (response.success) {
      log("Raw data: ${jsonEncode(response.data)}");
      return AttendanceCorrectionRes.fromJson(response.data);
    } else {
      return AttendanceCorrectionRes(
        success: response.success,
        data: null,
        message: response.message,
        count: 0,
      );
    }
  }
}

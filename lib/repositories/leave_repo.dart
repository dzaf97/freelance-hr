import 'package:get/instance_manager.dart';
import 'package:myezhr/models/leave/leave.dart';
import 'package:myezhr/models/leave/leave_request.dart';
import 'package:myezhr/models/leave/leave_type.dart';
import 'package:myezhr/utils/network.dart';

class LeaveRepo {
  Network network = Get.find();

  Future<List<Leave>> getLeave() async {
    NetworkMsg response = await network.get(url: '/leave');
    if (response.success) {
      List<dynamic> raw = response.data["data"];
      return raw.map((e) => Leave.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<List<Leave>> deleteLeave(int leaveId) async {
    NetworkMsg response = await network.delete(url: '/leave/$leaveId');
    if (response.success) {
      List<dynamic> raw = response.data["data"];
      return raw.map((e) => Leave.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<List<LeaveType>> getLeaveType() async {
    NetworkMsg response = await network.get(url: '/leave-type');
    // log(jsonEncode(response.data));
    if (response.success) {
      List<dynamic> raw = response.data["data"];
      return raw.map((e) => LeaveType.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<LeaveReqModel> postLeave(LeaveRequest request) async {
    NetworkMsg response =
        await network.post(url: '/leave', body: request.toJson());

    if (response.success) {
      return LeaveReqModel.fromJson(response.data);
    } else {
      return LeaveReqModel(
        success: false,
        count: 0,
        data: null,
        message: response.message,
      );
    }
  }

  Future<Leave> updateLeave(LeaveRequest request, String leaveId) async {
    NetworkMsg response = await network.put(
      url: '/leave/$leaveId',
      body: request.toJson(),
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
    );
    if (response.success) {
      var leave = Leave.fromJson(response.data["data"]);
      leave.success = true;
      leave.message = List<String>.from(response.data["message"]);
      return leave;
    } else {
      return Leave(
        success: false,
        message: List<String>.from(response.data["message"]),
      );
    }
  }
}

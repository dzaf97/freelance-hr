import 'package:get/get.dart';
import 'package:myezhr/models/request/pending_approval.dart';
import 'package:myezhr/models/request/request_list.dart';
import 'package:myezhr/utils/network.dart';

class RequestRepo {
  Network network = Get.find();

  Future<List<RequestList>> getRequestList() async {
    NetworkMsg response = await network.get(url: '/user/request');
    if (response.success) {
      List<dynamic> raw = response.data["data"] as List;
      return [...raw.map((e) => RequestList.fromJson(e))];
    } else {
      return [];
    }
  }

  Future<List<PendingApproval>> getPendingApprovalList() async {
    NetworkMsg response = await network.get(url: '/request-approval');
    if (response.success) {
      List<dynamic> raw = response.data["data"] as List;
      return [...raw.map((e) => PendingApproval.fromJson(e))];
    } else {
      return [];
    }
  }
}

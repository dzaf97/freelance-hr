import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myezhr/models/attendance/request.dart';
import 'package:myezhr/models/business_trip/business_trip.dart';
import 'package:myezhr/models/claim/claim.dart';
import 'package:myezhr/models/claim/claim_request.dart';
import 'package:myezhr/models/leave/leave.dart';
import 'package:myezhr/models/leave/leave_request.dart';
import 'package:myezhr/models/overtime/overtime_request.dart';
import 'package:myezhr/models/request/pending_approval.dart';
import 'package:myezhr/models/request/request_list.dart';
import 'package:myezhr/repositories/attendance_repo.dart';
import 'package:myezhr/repositories/business_repo.dart';
import 'package:myezhr/repositories/claim_repo.dart';
import 'package:myezhr/repositories/leave_repo.dart';
import 'package:myezhr/repositories/overtime_repo.dart';
import 'package:myezhr/repositories/request_repo.dart';
import 'package:myezhr/utils/formatter.dart';
import 'package:myezhr/utils/storage.dart';

class RequestController extends GetxController {
  RequestRepo requestRepo = RequestRepo();
  var selectedTab = 0.obs;
  RxBool adminView = false.obs;

  // UI variable
  var histories = <RequestList>[].obs;
  var pendingApprovals = <PendingApproval>[].obs;

  @override
  void onInit() async {
    await setup();
    super.onInit();
  }

  setup() async {
    log(Get.find<Storage>().isAdmin.toString(), name: "Request");
    adminView.value = Get.find<Storage>().isAdmin;
    histories.value = await requestRepo.getRequestList();
    pendingApprovals.value = await requestRepo.getPendingApprovalList();
    log("a ${jsonEncode(histories)}", name: "Request");
  }

  updateRequest(PendingApproval request, String status, String remarks) async {
    log("${request.toJson()}", name: "Request");

    switch (request.label) {
      case "leave":
        Leave response = await LeaveRepo().updateLeave(
          LeaveRequest(
            remarks: remarks,
            status: status,
          ),
          request.id.toString(),
        );
        if (response.success!) {
          pendingApprovals.value = await requestRepo.getPendingApprovalList();
          Get.back();
          Get.showSnackbar(
            GetSnackBar(
              message: response.message![0],
              margin: const EdgeInsets.symmetric(horizontal: 10),
              onTap: (snack) => Get.back(),
            ),
          );
        } else {
          Get.showSnackbar(
            GetSnackBar(
              message: response.message![0],
              margin: const EdgeInsets.symmetric(horizontal: 10),
              onTap: (snack) => Get.back(),
            ),
          );
        }
        break;
      case "claim":
        Claim response = await ClaimRepo().updateClaim(
          ClaimRequest(
            remarks: remarks,
            status: status,
          ),
          request.id.toString(),
        );
        if (response.success!) {
          pendingApprovals.value = await requestRepo.getPendingApprovalList();
          Get.back();
          Get.showSnackbar(
            GetSnackBar(
              message: response.message![0],
              margin: const EdgeInsets.symmetric(horizontal: 10),
              onTap: (snack) => Get.back(),
            ),
          );
        } else {
          Get.showSnackbar(
            GetSnackBar(
              message: response.message![0],
              margin: const EdgeInsets.symmetric(horizontal: 10),
              onTap: (snack) => Get.back(),
            ),
          );
        }
        break;

      case "overtime":
        OvertimeRequestModel response = await OvertimeRepo().updateOvertime(
          OvertimeRequest(
            status: status,
          ),
          request.id.toString(),
        );
        if (response.success) {
          pendingApprovals.value = await requestRepo.getPendingApprovalList();
          Get.back();
          Get.showSnackbar(
            GetSnackBar(
              message: response.message![0],
              margin: const EdgeInsets.symmetric(horizontal: 10),
              onTap: (snack) => Get.back(),
            ),
          );
        } else {
          Get.showSnackbar(
            GetSnackBar(
              message: response.message![0],
              margin: const EdgeInsets.symmetric(horizontal: 10),
              onTap: (snack) => Get.back(),
            ),
          );
        }
        break;

      case "attendance-correction":
        AttendanceCorrectionRes response =
            await AttendanceRepo().updateAttendanceCorrection(
          AttendanceCorrectionRequest(
            status: status,
          ),
          request.id.toString(),
        );
        if (response.success) {
          pendingApprovals.value = await requestRepo.getPendingApprovalList();
          Get.back();
          Get.showSnackbar(
            GetSnackBar(
              message: response.message![0],
              margin: const EdgeInsets.symmetric(horizontal: 10),
              onTap: (snack) => Get.back(),
            ),
          );
        } else {
          Get.showSnackbar(
            GetSnackBar(
              message: response.message![0],
              margin: const EdgeInsets.symmetric(horizontal: 10),
              onTap: (snack) => Get.back(),
            ),
          );
        }
        break;
      case "trip":
        BusinessTripRes response = await BusinessRepo().editTrip(
          BusinessTrip(
            id: request.id,
            status: status,
            type: request.type,
            remarks: remarks,
          ),
        );
        if (response.success ?? false) {
          pendingApprovals.value = await requestRepo.getPendingApprovalList();
          Get.back();
          Get.showSnackbar(
            GetSnackBar(
              message: response.message![0],
              margin: const EdgeInsets.symmetric(horizontal: 10),
              onTap: (snack) => Get.back(),
            ),
          );
        } else {
          Get.showSnackbar(
            GetSnackBar(
              message: response.message![0],
              margin: const EdgeInsets.symmetric(horizontal: 10),
              onTap: (snack) => Get.back(),
            ),
          );
        }
        break;
      default:
    }
  }
}

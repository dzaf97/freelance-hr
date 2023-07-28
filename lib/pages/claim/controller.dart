import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:myezhr/models/claim/claim.dart';
import 'package:myezhr/models/claim/claim_request.dart';
import 'package:myezhr/models/claim/claim_type.dart';
import 'package:myezhr/pages/claim/balance.dart';
import 'package:myezhr/repositories/claim_repo.dart';
import 'package:myezhr/utils/theme.dart';
import 'package:myezhr/widgets/dropdown_form.dart';

class ClaimController extends GetxController {
  // Dependency Injected
  final ClaimRepo claimRepo = ClaimRepo();

  // Form variable
  var file = File("").obs;
  var remarks = TextEditingController();
  var title = TextEditingController();
  var amount = TextEditingController();
  var selectedDate = DateTime.now().obs;
  var selectedClaimType = DropdownValue(name: "", value: 0).obs;
  var claimTypes = <DropdownValue>[];

  // UI variable
  var isLoading = true.obs;
  var selectedTab = 0.obs;
  var listBalanceChart = <BalanceChartData>[].obs;
  var listClaimHistory = <Claim>[].obs;
  var listDraftClaim = <Claim>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await setup();
  }

  setup() async {
    listClaimHistory.value = await claimRepo.getClaim();
    listDraftClaim.value = await claimRepo.getClaim(status: "draft");

    List<ClaimType> claimType = await claimRepo.getClaimType();
    listBalanceChart.value = claimType
        .map(
          (e) => BalanceChartData(
            chartData: [
              ChartData("Balance", e.balance, const Color(0xFFD1D1D6)),
              ChartData("Used", e.used, AppColor.primary),
            ],
            balance: e.balance,
            limitAmount: e.limitAmount,
            title: e.type,
            used: e.used,
          ),
        )
        .toList();

    if (claimType.isNotEmpty) {
      claimTypes = claimType
          .map(
            (e) => DropdownValue(
              name: e.type,
              value: e.claimCategoryId,
              additionalValue: e.pivot.claimTypeId,
            ),
          )
          .toList();

      selectedClaimType.value = claimTypes[0];
    }

    isLoading(false);
  }

  submitForm(ClaimRequest request, {bool isEdit = false}) async {
    bool isValid = request.validate();
    if (!isValid) {
      return Get.showSnackbar(
        GetSnackBar(
          message: "Please fill in all missing fields",
          margin: const EdgeInsets.symmetric(horizontal: 10),
          onTap: (snack) => Get.back(),
          duration: 2.seconds,
        ),
      );
    }
    EasyLoading.show();
    if (isEdit) {
      String id = request.id.toString();
      request.status = "draft";
      request.file = null;
      request.id = null;
      log("Claim Update Request: ${request.toJson()}");
      Claim response = await claimRepo.updateClaim(request, id);
      EasyLoading.dismiss();
      if (response.success!) {
        await setup();
        Get.back();
        Get.showSnackbar(
          GetSnackBar(
            message: response.message![0],
            margin: const EdgeInsets.symmetric(horizontal: 10),
            onTap: (snack) => Get.back(),
            duration: 2.seconds,
          ),
        );
      } else {
        Get.showSnackbar(
          GetSnackBar(
            message: response.message?[0] ?? "",
            margin: const EdgeInsets.symmetric(horizontal: 10),
            onTap: (snack) => Get.back(),
            duration: 2.seconds,
          ),
        );
      }
    } else {
      ClaimResponse response = await claimRepo.postClaim(request);
      EasyLoading.dismiss();
      if (response.success!) {
        await setup();
        Get.back();
        Get.showSnackbar(
          GetSnackBar(
            message: response.message![0],
            margin: const EdgeInsets.symmetric(horizontal: 10),
            onTap: (snack) => Get.back(),
            duration: 2.seconds,
          ),
        );
      } else {
        Get.showSnackbar(
          GetSnackBar(
            message: response.message?[0] ?? "",
            margin: const EdgeInsets.symmetric(horizontal: 10),
            onTap: (snack) => Get.back(),
            duration: 2.seconds,
          ),
        );
      }
    }
  }

  submitDraft() async {
    List<int?> claimIds = listDraftClaim.map((element) => element.id).toList();
    EasyLoading.show();

    bool isSuccess = await claimRepo.submitDraftClaim(claimIds);
    EasyLoading.dismiss();
    if (isSuccess) {
      await setup();
      Get.showSnackbar(
        GetSnackBar(
          message: "Claim submitted successfully.",
          margin: const EdgeInsets.symmetric(horizontal: 10),
          onTap: (snack) => Get.back(),
          duration: 2.seconds,
        ),
      );
    }
  }

  cancelClaim(String id) async {
    await claimRepo.deleteClaim(id);
    await setup();
    Get.back();
    Get.showSnackbar(
      GetSnackBar(
        message: "Claim successfully deleted!",
        margin: const EdgeInsets.symmetric(horizontal: 10),
        onTap: (snack) => Get.back(),
        duration: 2.seconds,
      ),
    );
  }
}

/*===============================
 =========== UI Model ===========
 ================================ */

class BalanceChartData {
  BalanceChartData({
    required this.chartData,
    required this.balance,
    required this.limitAmount,
    required this.title,
    required this.used,
  });

  final List<ChartData> chartData;
  final num balance;
  final num limitAmount;
  final String title;
  final num used;
}

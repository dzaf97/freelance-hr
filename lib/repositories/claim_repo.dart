import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:myezhr/models/claim/claim.dart';
import 'package:myezhr/models/claim/claim_request.dart';
import 'package:myezhr/models/claim/claim_type.dart';
import 'package:myezhr/utils/network.dart';

class ClaimRepo {
  Network network = Get.find();

  Future<List<Claim>> getClaim({String? status}) async {
    Map<String, String> queryParams = {};
    if (status != null) {
      queryParams.addEntries({"status": status}.entries);
    }
    NetworkMsg response =
        await network.get(url: '/claim', queryParams: queryParams);
    if (response.success) {
      log(response.data["data"].toString());
      List<dynamic> raw = response.data["data"] as List<dynamic>;
      return raw.map((e) => Claim.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<List<ClaimType>> getClaimType() async {
    NetworkMsg response = await network.get(url: '/claim-type');
    log("Get Claim Type: ${response.data}");

    if (response.success) {
      List<dynamic> raw = response.data["data"] as List<dynamic>;
      return raw.map((e) => ClaimType.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<ClaimResponse> postClaim(ClaimRequest request) async {
    log(jsonEncode(request.toJson()));
    NetworkMsg response =
        await network.post(url: '/claim', body: request.toJson());
    log(jsonEncode(response.data));
    if (response.success) {
      ClaimResponse data = ClaimResponse.fromJson(response.data["data"]);
      data.message = response.data["message"];
      data.success = true;
      return data;
    } else {
      return ClaimResponse(success: false, message: response.data["message"]);
    }
  }

  Future<bool> submitDraftClaim(List<int?> claimIds) async {
    NetworkMsg response = await network.postJson(
        headers: {},
        url: '/claim/submit',
        body: jsonEncode({"claim_ids": claimIds}));
    log(response.data.toString());
    if (response.success) {
      // ClaimResponse data = ClaimResponse.fromJson(response.data["data"]);
      // data.message = response.data["message"];
      // data.success = true;
      return true;
    } else {
      return false;
      // return ClaimResponse(success: false, message: response.data["message"]);
    }
  }

  Future<Claim> updateClaim(ClaimRequest request, String claimId) async {
    NetworkMsg response = await network.put(
      url: '/claim/$claimId',
      body: request.toJson(),
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
    );
    if (response.success) {
      var leave = Claim.fromJson(response.data["data"]);
      leave.success = true;
      leave.message = List<String>.from(response.data["message"]);
      return leave;
    } else {
      return Claim(
        success: false,
        message: List<String>.from(response.data["message"]),
      );
    }
  }

  Future<List<Claim>> deleteClaim(String claimId) async {
    NetworkMsg response = await network.delete(url: '/claim/$claimId');
    if (response.success) {
      List<dynamic> raw = response.data["data"];
      return raw.map((e) => Claim.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}

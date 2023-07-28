import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:myezhr/models/company/announcement.dart';
import 'package:myezhr/models/company/company.dart';
import 'package:myezhr/utils/network.dart';
import 'package:myezhr/utils/storage.dart';

class CompanyRepo {
  Network network = Get.find();

  Future<List<Company>> getCompany() async {
    // Always set to demo to retrieve company list
    network.setTenant("demo");
    // Get.find<Storage>().setCompanyName = "Demo";

    NetworkMsg response = await network.get(url: '/company');
    log(jsonEncode(response.data));
    if (response.success) {
      List<dynamic> raw = response.data["data"] as List<dynamic>;
      return raw.map((e) => Company.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<Company?> getCompanyProfile() async {
    NetworkMsg response = await network.get(url: '/company/profile');
    if (response.success) {
      return Company.fromJson(response.data["data"]);
    } else {
      return null;
    }
  }

  Future<List<Announcement>?> getCompanyAnnouncement() async {
    NetworkMsg response = await network.get(url: '/company/announcement');
    if (response.success) {
      List<dynamic> raw = response.data["data"] as List<dynamic>;
      return raw.map((e) => Announcement.fromJson(e)).toList();
    } else {
      return null;
    }
  }
}

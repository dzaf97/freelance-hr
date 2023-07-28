import 'dart:convert';

import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:myezhr/models/shift/shift.dart';
import 'package:myezhr/models/user/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Storage extends GetxService {
  // GetStorage box = GetStorage('storage');
  final SharedPreferences prefs;

  Storage(this.prefs);

  String? get getToken => prefs.getString("token");
  set setToken(String token) => prefs.setString("token", token);

  String? get getTenant => prefs.getString("tenant");
  set setTenant(String tenant) => prefs.setString("tenant", tenant);

  String? get getCompanyName => prefs.getString("companyName");
  set setCompanyName(String companyName) =>
      prefs.setString("companyName", companyName);

  User get getUser => User.fromJson(jsonDecode(prefs.getString("user")!));
  set setUser(User user) => prefs.setString("user", jsonEncode(user));

  Shift? get getShift => (prefs.getString("shift") != null)
      ? Shift.fromJson(jsonDecode(prefs.getString("shift")!))
      : null;
  set setShift(Shift shiftType) =>
      prefs.setString("shift", jsonEncode(shiftType));

  String get getPassword => prefs.getString("password")!;
  set setPassword(String password) => prefs.setString("password", password);

  String get getShiftType => prefs.getString("shiftType")!;
  set setShiftType(String shiftType) => prefs.setString("shiftType", shiftType);

  String get getClockInId => prefs.getString("clockInId")!;
  set setClockInId(String id) => prefs.setString("clockInId", id);

  bool get isAdmin => User.fromJson(jsonDecode(prefs.getString("user")!))
      .roles!
      .where(
        (element) => (element.name == "manager" ||
            element.name == "admin" ||
            element.name == "super-admin"),
      )
      .isNotEmpty;

  int get userId => User.fromJson(jsonDecode(prefs.getString("user")!)).id;

  String get getName =>
      User.fromJson(jsonDecode(prefs.getString("user")!)).name ?? "";
}

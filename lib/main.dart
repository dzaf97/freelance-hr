import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:myezhr/pages/login/login.dart';
import 'package:myezhr/pages/splash_screen/splash_screen.dart';
import 'package:myezhr/routes/routes.dart';
import 'package:myezhr/utils/network.dart';
import 'package:myezhr/utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      // initialRoute: HomeLayout.route,
      initialRoute: Splash.route,
      getPages: routes,
      theme: primaryTheme,
    ),
  );
}

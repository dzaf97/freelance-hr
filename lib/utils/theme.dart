import 'package:flutter/material.dart';

class AppColor {
  static Color primary = const Color(0xFFA6517E);
  static Color secondary = const Color(0xFF211A1E);
  static Color background = const Color(0xFFF2F2F7);
  static Color tertiary = const Color(0xFF686777);
}

MaterialColor _appSwatch = MaterialColor(AppColor.primary.value, {
  50: AppColor.primary.withOpacity(.1),
  100: AppColor.primary.withOpacity(.2),
  200: AppColor.primary.withOpacity(.3),
  300: AppColor.primary.withOpacity(.4),
  400: AppColor.primary.withOpacity(.5),
  500: AppColor.primary.withOpacity(.6),
  600: AppColor.primary.withOpacity(.7),
  700: AppColor.primary.withOpacity(.8),
  800: AppColor.primary.withOpacity(.9),
  900: AppColor.primary.withOpacity(1),
});

ThemeData primaryTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: _appSwatch),
  scaffoldBackgroundColor: AppColor.background,
  primarySwatch: _appSwatch,
  bottomAppBarColor: _appSwatch,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColor.primary,
    foregroundColor: Colors.white,
  ),
);

class AppStyle {
  TextStyle pageHeading = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 24,
  );

  TextStyle title = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 24,
    color: Color(0xff686777),
  );

  TextStyle menuTitle = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18,
    color: Colors.white,
  );
  TextStyle formTitle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );
  TextStyle formSubTitle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  TextStyle datePickerDate = const TextStyle(
    fontSize: 16,
  );

  TextStyle button = const TextStyle(
    fontSize: 18,
    color: Colors.white,
  );

  TextStyle detailTitle = const TextStyle(
    color: Color(0xFF686777),
  );

  TextStyle detailSubtitle = const TextStyle(fontWeight: FontWeight.w600);
}

AppStyle styles = AppStyle();

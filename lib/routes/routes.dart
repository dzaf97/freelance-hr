import 'package:get/get.dart';
import 'package:myezhr/pages/attendance/attendance.dart';
import 'package:myezhr/pages/attendance/controller.dart';
import 'package:myezhr/pages/attendance/record_form/attendance_location.dart';
import 'package:myezhr/pages/attendance/record_form/attendance_review.dart';
import 'package:myezhr/pages/business_trip/business_trip.dart';
import 'package:myezhr/pages/business_trip/controller.dart';
import 'package:myezhr/pages/claim/claim.dart';
import 'package:myezhr/pages/claim/controller.dart';
import 'package:myezhr/pages/home_layout/company/policy/company_policy.dart';
import 'package:myezhr/pages/home_layout/company/policy/controller.dart';
import 'package:myezhr/pages/home_layout/company/profile/company_profile.dart';
import 'package:myezhr/pages/home_layout/company/profile/controller.dart';
import 'package:myezhr/pages/home_layout/controller.dart';
import 'package:myezhr/pages/home_layout/home/controller.dart';
import 'package:myezhr/pages/home_layout/layout.dart';
import 'package:myezhr/pages/leave/controller.dart';
import 'package:myezhr/pages/leave/leave.dart';
import 'package:myezhr/pages/login/controller.dart';
import 'package:myezhr/pages/login/login.dart';
import 'package:myezhr/pages/overtime/controller.dart';
import 'package:myezhr/pages/overtime/overtime.dart';
import 'package:myezhr/pages/payslip/controller.dart';
import 'package:myezhr/pages/payslip/payslip.dart';
import 'package:myezhr/pages/shared/camera_page.dart';
import 'package:myezhr/pages/splash_screen/controller.dart';
import 'package:myezhr/pages/splash_screen/splash_screen.dart';
import 'package:myezhr/utils/network.dart';
import 'package:myezhr/utils/storage.dart';

List<GetPage> routes = [
  GetPage(
    name: Splash.route,
    page: () => const Splash(),
    binding: BindingsBuilder(() async {
      Get.put(SplashController());
    }),
  ),
  GetPage(
    name: Login.route,
    page: () => const Login(),
    // middlewares: [GlobalMiddleware()],
    binding: BindingsBuilder(() async {
      Get.lazyPut<LoginController>(
        () => LoginController(),
      );
    }),
  ),
  GetPage(
    name: HomeLayout.route,
    page: () => HomeLayout(),
    // middlewares: [AuthMiddleware()],
    binding: BindingsBuilder(() {
      Get.lazyPut<HomeLayoutController>(
        () => HomeLayoutController(),
      );
      Get.lazyPut<HomeController>(
        () => HomeController(),
      );
    }),
  ),
  GetPage(
    name: Leave.route,
    page: () => const Leave(),
    // middlewares: [AuthMiddleware()],
    binding: BindingsBuilder(() {
      Get.lazyPut<LeaveController>(
        () => LeaveController(),
      );
    }),
  ),
  GetPage(
    name: Attendance.route,
    page: () => const Attendance(),
    binding: BindingsBuilder(() {
      Get.lazyPut<AttendanceController>(
        () => AttendanceController(),
      );
    }),
  ),
  GetPage(
    name: AttendanceLocation.route,
    page: () => const AttendanceLocation(),
    binding: BindingsBuilder(() {
      Get.lazyPut<AttendanceController>(
        () => AttendanceController(),
      );
    }),
  ),
  GetPage(
    name: AttendanceReview.route,
    page: () => const AttendanceReview(),
  ),
  GetPage(
    name: Claim.route,
    page: () => const Claim(),
    binding: BindingsBuilder(() {
      Get.lazyPut<ClaimController>(
        () => ClaimController(),
      );
    }),
  ),
  GetPage(
    name: Payslip.route,
    page: () => const Payslip(),
    binding: BindingsBuilder(() {
      Get.lazyPut<PayslipController>(
        () => PayslipController(),
      );
    }),
  ),
  GetPage(
    name: CompanyProfile.route,
    page: () => const CompanyProfile(),
    binding: BindingsBuilder(() {
      Get.lazyPut<CompanyProfileController>(
        () => CompanyProfileController(),
      );
    }),
  ),
  GetPage(
    name: Overtime.route,
    page: () => const Overtime(),
    binding: BindingsBuilder(() {
      Get.lazyPut<OvertimeController>(
        () => OvertimeController(),
      );
    }),
  ),
  GetPage(
    name: CompanyPolicy.route,
    page: () => const CompanyPolicy(),
    binding: BindingsBuilder(() {
      Get.lazyPut<CompanyPolicyController>(
        () => CompanyPolicyController(),
      );
    }),
  ),
  GetPage(
    name: BusinessTrip.route,
    page: () => const BusinessTrip(),
    binding: BindingsBuilder(() {
      Get.lazyPut<BusinessTripController>(
        () => BusinessTripController(),
      );
    }),
  ),

  // SHARED
  GetPage(
    name: CameraPage.route,
    page: () => const CameraPage(),
  ),
];

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:myezhr/models/company/announcement.dart';
import 'package:myezhr/pages/attendance/attendance.dart';
import 'package:myezhr/pages/attendance/controller.dart';
import 'package:myezhr/pages/business_trip/business_trip.dart';
import 'package:myezhr/pages/claim/claim.dart';
import 'package:myezhr/pages/home_layout/features/controller.dart';
import 'package:myezhr/pages/leave/leave.dart';
import 'package:myezhr/pages/overtime/overtime.dart';
import 'package:myezhr/pages/payslip/payslip.dart';
import 'package:myezhr/utils/formatter.dart';
import 'package:myezhr/widgets/menu_link.dart';

class Features extends GetView<FeatureController> {
  const Features({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          elevation: 0,
          leading: Container(),
          title: const Text("Features"),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MenuLink(
                      image: SvgPicture.asset('assets/svg/Leave.svg'),
                      linkName: "Leave",
                      onTap: () => Get.toNamed(Leave.route),
                    ),
                    MenuLink(
                      image: SvgPicture.asset('assets/svg/Attendance.svg'),
                      linkName: "Attendance",
                      onTap: () {
                        Get.replace(AttendanceController());
                        Get.toNamed(Attendance.route);
                      },
                    ),
                    MenuLink(
                      image: SvgPicture.asset('assets/svg/Claim.svg'),
                      linkName: "Claim",
                      onTap: () => Get.toNamed(Claim.route),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(40, 30, 40, 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MenuLink(
                      image: SvgPicture.asset('assets/svg/Payslip.svg'),
                      linkName: "Payslip",
                      onTap: () => Get.toNamed(Payslip.route),
                    ),
                    MenuLink(
                      image: SvgPicture.asset('assets/svg/Business.svg'),
                      linkName: "Business Trip",
                      onTap: () => Get.toNamed(BusinessTrip.route),
                      // onTap: () => Get.showSnackbar(
                      //   const GetSnackBar(
                      //     duration: Duration(seconds: 2),
                      //     message: "Coming soon!",
                      //     margin: EdgeInsets.symmetric(
                      //         horizontal: 10, vertical: 10),
                      //   ),
                      // ),
                    ),
                    MenuLink(
                      image: SvgPicture.asset('assets/svg/Overtime.svg'),
                      linkName: "Overtime",
                      onTap: () => Get.toNamed(Overtime.route),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Announcement",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Obx(
                () => Column(
                  children: controller.announcements
                      .map((element) => AnnouncementTile(announcement: element))
                      .toList(),
                ),
              ),

              // Container(
              //   alignment: Alignment.center,
              //   child: Image.asset('assets/images/Feature_1.png'),
              // ),
            ],
          ),
        ));
  }
}

class AnnouncementTile extends StatelessWidget {
  const AnnouncementTile({
    Key? key,
    required this.announcement,
  }) : super(key: key);

  final Announcement announcement;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 5,
              offset: const Offset(2, 5),
            )
          ],
          color: const Color(0xFFF2F2F7),
          border: Border.all(
            color: const Color(0xFFD1D1D6),
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15.0),
            decoration: const BoxDecoration(
                border: Border(
              bottom: BorderSide(color: Color(0xFFD1D1D6)),
            )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  dayDateFormat
                      .format(announcement.createdAt ?? DateTime.now()),
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SvgPicture.asset('assets/svg/Dots.svg')
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   "Author: ${announcement.authorId}",
                //   style: const TextStyle(
                //     fontWeight: FontWeight.w600,
                //   ),
                // ),
                // const SizedBox(height: 6),
                Text(
                  announcement.title ?? "-",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  announcement.content ?? "",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myezhr/pages/home_layout/company/company.dart';
import 'package:myezhr/pages/home_layout/controller.dart';
import 'package:myezhr/pages/home_layout/features/features.dart';
import 'package:myezhr/pages/home_layout/home/home.dart';
import 'package:myezhr/pages/home_layout/profile/profile.dart';
import 'package:myezhr/pages/home_layout/request/request.dart';
import 'package:myezhr/utils/theme.dart';
import 'package:myezhr/widgets/bottom_bar.dart';

class HomeLayout extends GetView<HomeLayoutController> {
  HomeLayout({Key? key}) : super(key: key);

  static String route = '/home';

  final pages = [
    const Home(),
    const Features(),
    // const Company(),
    const Request(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Obx(() => pages[controller.selectedTab.value]),
        bottomNavigationBar: Obx(
          () => BottomNavyBar(
            selectedIndex: controller.selectedTab.value,
            backgroundColor: Colors.white,
            items: <BottomNavyBarItem>[
              BottomNavyBarItem(
                activeColor: AppColor.primary,
                icon: Image.asset(
                  'assets/images/Home.png',
                  color: controller.selectedTab.value == 0 ? Colors.white : AppColor.primary,
                ),
                title: const Text("Home"),
              ),
              BottomNavyBarItem(
                activeColor: AppColor.primary,
                icon: Image.asset(
                  'assets/images/Feature.png',
                  color: controller.selectedTab.value == 1 ? Colors.white : AppColor.primary,
                ),
                title: const Text("Features"),
              ),
              // BottomNavyBarItem(
              //   activeColor: AppColor.primary,
              //   icon: Image.asset(
              //     'assets/images/Clock.png',
              //     color: controller.selectedTab.value == 2
              //         ? Colors.white
              //         : AppColor.primary,
              //   ),
              //   title: const Text("Company"),
              // ),
              BottomNavyBarItem(
                activeColor: AppColor.primary,
                icon: Image.asset(
                  'assets/images/Bell.png',
                  color: controller.selectedTab.value == 2 ? Colors.white : AppColor.primary,
                ),
                title: const Text("Request"),
              ),
              BottomNavyBarItem(
                activeColor: AppColor.primary,
                icon: Image.asset(
                  'assets/images/People.png',
                  color: controller.selectedTab.value == 3 ? Colors.white : AppColor.primary,
                ),
                title: const Text("Profile"),
              )
            ],
            onItemSelected: controller.onItemSelected,
          ),
        ),
      ),
    );
  }
}

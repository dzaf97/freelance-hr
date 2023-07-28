import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:myezhr/pages/home_layout/company/policy/company_policy.dart';
import 'package:myezhr/pages/home_layout/company/profile/company_profile.dart';
import 'package:myezhr/utils/theme.dart';

class Company extends GetView {
  const Company({Key? key}) : super(key: key);

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
        title: const Text("Company"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const StaffList(),
            const Divider(color: Colors.transparent),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Company Info",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      CompanyInfoTile(
                        title: "Profile",
                        onTap: () => Get.toNamed(CompanyProfile.route),
                      ),
                      CompanyInfoTile(
                        title: "Policies",
                        onTap: () => Get.toNamed(CompanyPolicy.route),
                      ),
                      CompanyInfoTile(
                        title: "Events",
                        onTap: () => {},
                      ),
                      CompanyInfoTile(
                        title: "Holidays",
                        onTap: () => {},
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CompanyInfoTile extends StatelessWidget {
  const CompanyInfoTile({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () => onTap(),
          title: Text(
            title,
            style: const TextStyle(fontSize: 14),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 18,
          ),
        ),
        const Divider(
          height: 0,
          thickness: 1,
        ),
      ],
    );
  }
}

class StaffList extends StatelessWidget {
  const StaffList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "List of Staff",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(
                "View All",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColor.primary,
                ),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              TeammateAvatar(
                name: "Muhamad Fadhil",
              ),
              TeammateAvatar(
                name: "Syahrul Fahmi",
              ),
              TeammateAvatar(
                name: "Zakwan Shaj",
              ),
              TeammateAvatar(
                name: "Ahmad Zulkarnaen",
              ),
            ],
          ),
        )
      ],
    );
  }
}

class TeammateAvatar extends StatelessWidget {
  const TeammateAvatar({
    Key? key,
    required this.name,
    this.timeIn,
    this.timeOut,
  }) : super(key: key);

  final String name;
  final String? timeIn;
  final String? timeOut;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Color(0xFFD9D9D9),
          radius: 25,
          child: Text(
            "${name.split(" ").first[0]}${name.split(" ").last[0]}",
            style: const TextStyle(
              color: Color(0xFF686777),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          width: 65,
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          width: 65,
          child: Text(
            timeIn ?? "--|--",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: Color(0xFF27AE60),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 10),
          width: 65,
          child: Text(
            timeOut ?? "--|--",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: Color(0xFFFF453A),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myezhr/pages/home_layout/profile/controller.dart';
import 'package:myezhr/pages/login/login.dart';
import 'package:myezhr/utils/storage.dart';
import 'package:myezhr/utils/theme.dart';

class Profile extends GetView<ProfileController> {
  const Profile({Key? key}) : super(key: key);

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
        title: const Text("Profile"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => controller.logout(),
              child: const Icon(Icons.logout),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(
              name: controller.name,
              image: controller.image,
            ),
            // Column(
            //   children: [
            //     const Padding(
            //       padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            //       child: Align(
            //         alignment: Alignment.centerLeft,
            //         child: Text(
            //           "Profile Details",
            //           style: TextStyle(fontWeight: FontWeight.w600),
            //         ),
            //       ),
            //     ),
            //     Container(
            //       color: Colors.white,
            //       child: Column(
            //         children: [
            //           ProfileTile(
            //             title: "Profile Details",
            //             onTap: () => {},
            //           ),
            //           ProfileTile(
            //             title: "Emergency Contact",
            //             onTap: () => {},
            //           ),
            //           ProfileTile(
            //             title: "Family & Dependent",
            //             onTap: () => {},
            //           ),
            //           ProfileTile(
            //             title: "Education",
            //             onTap: () => {},
            //           ),
            //           ProfileTile(
            //             title: "Medical Record",
            //             onTap: () => {},
            //           ),
            //           ProfileTile(
            //             title: "Experience",
            //             onTap: () => {},
            //           ),
            //         ],
            //       ),
            //     )
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.name,
    required this.image,
  }) : super(key: key);

  final RxString name;
  final RxString image;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        margin: const EdgeInsets.symmetric(vertical: 20),
        width: Get.width * 0.9,
        decoration: BoxDecoration(
            color: AppColor.primary, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 4),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 50,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: ClipOval(
                    child: (image.value != "")
                        ? Image.network(image.value)
                        : Image.asset("assets/images/user.png"),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name.value,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                Get.find<Storage>().getCompanyName ?? "Demo",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({
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

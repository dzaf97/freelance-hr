import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myezhr/pages/home_layout/company/profile/controller.dart';
import 'package:myezhr/utils/storage.dart';
import 'package:myezhr/utils/theme.dart';

class CompanyProfile extends GetView<CompanyProfileController> {
  const CompanyProfile({
    Key? key,
  }) : super(key: key);

  static String route = '/company/profile';

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
        title: const Text("Company Profile"),
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: Get.width * 0.9,
              height: 150,
              margin: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: const Color(0xFFD1D1D6),
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset('assets/images/Databolt.png'),
            ),
          ),
          Container(
            width: Get.width * 0.9,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: const Color(0xFFD1D1D6),
                ),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CompanyDetail(
                  title: "Company Name",
                  detail: Get.find<Storage>().getCompanyName ?? "Demo",
                ),
                const CompanyDetail(
                  title: "Address",
                  detail:
                      "Lot 2044, Mukim Sungai Baru Ulu Solok Duku,78300 Masjid Tanah,Melaka.",
                ),
                const CompanyDetail(
                  title: "Local Company Address",
                  detail:
                      "Lot 2044, Mukim Sungai Baru Ulu Solok Duku,78300 Masjid Tanah,Melaka.",
                ),
                const CompanyDetail(
                  title: "Phone",
                  detail: "06 - 385 2804",
                ),
                const CompanyDetail(
                  title: "Fax",
                  detail: "06 - 385 2804",
                ),
                const CompanyDetail(
                  title: "Email",
                  detail: "hanafee.zin@databolt.my",
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CompanyDetail extends StatelessWidget {
  const CompanyDetail({
    Key? key,
    required this.title,
    required this.detail,
  }) : super(key: key);

  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyle().detailTitle,
          ),
          Text(detail),
        ],
      ),
    );
  }
}

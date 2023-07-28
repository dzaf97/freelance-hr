import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:myezhr/pages/home_layout/company/policy/controller.dart';
import 'package:myezhr/utils/theme.dart';
import 'package:myezhr/widgets/button.dart';
import 'package:myezhr/widgets/search_input.dart';

class CompanyPolicy extends GetView<CompanyPolicyController> {
  const CompanyPolicy({
    Key? key,
  }) : super(key: key);

  static String route = '/company/policy';

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
        title: const Text("Company Policies"),
      ),
      body: Column(
        children: [
          SearchInput(
            controller: TextEditingController(),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: ListView(
                children: const [
                  PolicyTile(
                    title: "Come in late",
                    date: "01 Aug 2022",
                  ),
                  PolicyTile(
                    title: "MC exceeded",
                    date: "01 Aug 2022",
                  )
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AppButton(
        onPressed: () => controller.openForm(),
        width: Get.width * 0.9,
        title: "Add Policy",
      ),
    );
  }
}

class PolicyTile extends StatelessWidget {
  const PolicyTile({
    Key? key,
    required this.title,
    required this.date,
  }) : super(key: key);

  final String title;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: TextStyle(
              color: AppColor.primary,
              fontSize: 14,
            ),
          ),
          subtitle: Text(
            date,
            style: AppStyle().detailTitle,
          ),
          trailing: SvgPicture.asset('assets/svg/Edit.svg'),
        ),
        const Divider(
          height: 0,
          thickness: 1,
        )
      ],
    );
  }
}

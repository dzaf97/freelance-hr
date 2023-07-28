import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:myezhr/pages/payslip/controller.dart';
import 'package:myezhr/utils/formatter.dart';
import 'package:myezhr/utils/network.dart';
import 'package:myezhr/utils/theme.dart';

class Payslip extends GetView<PayslipController> {
  const Payslip({Key? key}) : super(key: key);

  static String route = "/payslip";

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
        title: const Text("Payslip"),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(
              color: const Color(0xFFAAE6FF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Payslip Password",
                  style: TextStyle(
                    color: Color(0xFF0071A4),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Text(
                    "Use your login password to download the payslip.",
                    style: TextStyle(color: Color(0xFF0071A4)),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Obx(
                () => ListView(
                  children: controller.payslips
                      .map((element) => PayslipTile(
                            name: element.name,
                            date: dateFormat.format(element.createdAt),
                            textField: controller.password,
                            function: () => controller.validatePassword(
                              "$cloudPath${element.attachmentPath}",
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PayslipTile extends StatelessWidget {
  const PayslipTile({
    Key? key,
    required this.date,
    required this.name,
    required this.function,
    required this.textField,
  }) : super(key: key);

  final String date;
  final String name;
  final TextEditingController textField;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () => Get.dialog(
            AlertDialog(
              title: Text("Password"),
              content: TextField(
                controller: textField,
              ),
              actions: [
                TextButton(
                  onPressed: () => function(),
                  child: const Text("Okay"),
                )
              ],
            ),
            useSafeArea: true,
          ),
          // onTap: () => (GetPlatform.isAndroid)
          //     ? launchUrl(Uri.parse(attachment),
          //         mode: LaunchMode.externalApplication)
          //     : launchUrl(Uri.parse(attachment)),
          title: Text(
            date,
            style: const TextStyle(
              color: Color(0xFF211A1E),
              fontSize: 14,
            ),
          ),
          subtitle: Text(
            name,
            style: TextStyle(color: AppColor.primary),
          ),
          trailing: SvgPicture.asset(
            'assets/svg/Download.svg',
            width: 20,
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

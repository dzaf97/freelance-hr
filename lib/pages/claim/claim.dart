import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myezhr/pages/claim/balance.dart';
import 'package:myezhr/pages/claim/claim_form.dart';
import 'package:myezhr/pages/claim/controller.dart';
import 'package:myezhr/pages/claim/draft.dart';
import 'package:myezhr/pages/claim/history.dart';
import 'package:myezhr/widgets/button.dart';

class Claim extends GetView<ClaimController> {
  const Claim({Key? key}) : super(key: key);

  static String route = "/claim";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          elevation: 0,
          title: const Text("Claim"),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 15),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(Icons.settings_outlined),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Container(
              height: 36,
              padding: const EdgeInsets.all(3),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                  color: const Color(0xFFe3e3e7),
                  borderRadius: BorderRadius.circular(8)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black,
                  indicator: ShapeDecoration(
                    color: Colors.white,
                    shadows: kElevationToShadow[2],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelPadding: const EdgeInsets.all(0),
                  indicatorPadding: const EdgeInsets.all(0),
                  onTap: (index) {
                    controller.selectedTab(index);
                  },
                  tabs: const [
                    Tab(text: "Balance"),
                    Tab(text: "History"),
                    Tab(text: "Draft"),
                  ],
                ),
              ),
            ),
            Obx(
              () => [
                Balance(
                  isLoading: controller.isLoading,
                  listBalanceChart: controller.listBalanceChart,
                ),
                History(
                  listClaimHistory: controller.listClaimHistory,
                ),
                Draft(
                  listDraftClaim: controller.listDraftClaim,
                ),
              ][controller.selectedTab.value],
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Obx(
          () => (controller.selectedTab.value != 2)
              ? AppButton(
                  onPressed: () {
                    controller.selectedDate.value = DateTime.now();
                    controller.remarks.clear();
                    controller.title.clear();
                    controller.amount.clear();
                    controller.remarks.clear();
                    Get.bottomSheet(
                      ClaimForm(
                        remarks: controller.remarks,
                        title: controller.title,
                        file: controller.file,
                        amount: controller.amount,
                        selectedDate: controller.selectedDate,
                        selectedClaimType: controller.selectedClaimType,
                        claimTypes: controller.claimTypes,
                        submitForm: controller.submitForm,
                        cancelClaim: controller.cancelClaim,
                      ),
                      isScrollControlled: true,
                    );
                  },
                  width: Get.width * 0.9,
                  title: "Submit New Claim",
                )
              : AppButton(
                  onPressed: () => controller.submitDraft(),
                  width: Get.width * 0.9,
                  title: "Submit All Draft",
                ),
        ),
      ),
    );
  }
}

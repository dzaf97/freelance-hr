import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:myezhr/pages/home_layout/request/controller.dart';
import 'package:myezhr/pages/home_layout/request/history.dart';
import 'package:myezhr/pages/home_layout/request/pending.dart';

class Request extends GetView<RequestController> {
  const Request({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          elevation: 0,
          leading: Container(),
          title: const Text("Request"),
        ),
        body: Obx(
          () => controller.adminView.value
              ? Column(
                  children: [
                    Container(
                      height: 36,
                      padding: const EdgeInsets.all(3),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
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
                            Tab(text: "History"),
                            Tab(text: "Pending Approval"),
                          ],
                        ),
                      ),
                    ),
                    Obx(
                      () => [
                        History(
                          histories: controller.histories,
                        ),
                        Pending(
                          pendingApprovals: controller.pendingApprovals,
                          onPressed: controller.updateRequest,
                        ),
                      ][controller.selectedTab.value],
                    )
                  ],
                )
              : Column(
                  children: [
                    const SizedBox(height: 20),
                    History(
                      histories: controller.histories,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

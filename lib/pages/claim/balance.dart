import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:myezhr/pages/claim/controller.dart';
import 'package:myezhr/utils/theme.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Balance extends StatelessWidget {
  const Balance({
    Key? key,
    required this.isLoading,
    required this.listBalanceChart,
  }) : super(key: key);

  final RxBool isLoading;
  final RxList<BalanceChartData> listBalanceChart;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: Obx(
          () => (isLoading.value)
              ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  margin: const EdgeInsets.only(bottom: 150),
                  child: const Center(
                    child: LinearProgressIndicator(),
                  ),
                )
              : ListView(
                  children: listBalanceChart
                      .map(
                        (element) => BalanceChart(
                          chartData: element.chartData,
                          title: element.title,
                          limitAmount: element.limitAmount,
                          used: element.used,
                          balance: element.balance,
                        ),
                      )
                      .toList(),
                ),
        ),
      ),
    );
  }
}

class BalanceChart extends StatelessWidget {
  const BalanceChart({
    Key? key,
    required this.chartData,
    required this.title,
    required this.limitAmount,
    required this.used,
    required this.balance,
  }) : super(key: key);

  final List<ChartData> chartData;
  final String title;
  final num limitAmount;
  final num used;
  final num balance;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
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
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SvgPicture.asset('assets/svg/Dots.svg')
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Limit: RM $limitAmount",
                    style: const TextStyle(
                      color: Color(0xFF636366),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
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
            child: Stack(
              children: [
                Positioned(
                  left: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Used",
                        style: TextStyle(
                          color: Color(0xFF636366),
                        ),
                      ),
                      Text(
                        "RM $used",
                        style: TextStyle(
                          color: AppColor.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Balance",
                        style: TextStyle(
                          color: Color(0xFF636366),
                        ),
                      ),
                      Text(
                        "RM $balance",
                        style: const TextStyle(
                          color: Color(0xFF686777),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: SfCircularChart(
                    margin: EdgeInsets.zero,
                    series: <CircularSeries>[
                      DoughnutSeries<ChartData, String>(
                        radius: "100%",
                        dataSource: chartData,
                        pointColorMapper: (ChartData data, _) => data.color,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                      )
                    ],
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

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final num y;
  final Color color;
}

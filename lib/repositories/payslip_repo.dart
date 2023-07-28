import 'package:get/get.dart';
import 'package:myezhr/models/payslip/payslip.dart';
import 'package:myezhr/utils/network.dart';

class PayslipRepo {
  // final box = GetStorage();
  Network network = Get.find();

  Future<List<Payslip>> getPayslip() async {
    NetworkMsg response = await network.get(url: '/payslip');

    if (response.success) {
      List raw = response.data["data"];
      return raw.map((e) => Payslip.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}

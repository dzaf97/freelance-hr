import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:myezhr/models/company/company.dart';
import 'package:myezhr/models/login/login.dart';
import 'package:myezhr/models/login/login_request.dart';
import 'package:myezhr/pages/home_layout/layout.dart';
import 'package:myezhr/pages/login/login.dart';
import 'package:myezhr/repositories/auth_repo.dart';
import 'package:myezhr/repositories/company_repo.dart';
import 'package:myezhr/utils/network.dart';
import 'package:myezhr/utils/storage.dart';

class LoginController extends GetxController {
  AuthRepo authRepo = AuthRepo();
  CompanyRepo companyRepo = CompanyRepo();
  final email = TextEditingController();
  final password = TextEditingController();
  final companyNameController = TextEditingController();
  RxList<Company> companies = RxList();
  RxBool isOtherMethod = false.obs;
  Rx<Widget> animatedWidget = Rx(Container());
  String tenantId = "demo";
  String companyName = "Demo";
  RxString logo = "".obs;

  @override
  void onInit() async {
    animatedWidget.value = LoginField(controller: this);

    // ADMIN
    // email.text = "admin@admin.com";
    // password.text = "password";

    // Hanafee (DATABOLT)
    // email.text = "hanafee.zin@databolt.my";
    // password.text = "password";

    // Faizal (DATABOLT)
    // email.text = "faizal.ngatuan@databolt.my";
    // password.text = "password";

    // Azrina (DATABOLT)
    email.text = "azrina@databolt.my";
    password.text = "password";

    // Adlina (DATABOLT)
    // email.text = "adlinaa98@gmail.com";
    // password.text = "password";

    // FARAH  (DATABOLT)
    // email.text = "farahasni@databolt.my";
    // password.text = "password";

    // Suhaidah (DATABOLT)
    // email.text = "suhaidah@databolt.my";
    // password.text = "password";

    // MLB
    // email.text = "missladybossempire@gmail.com";
    // password.text = "Kyena_5046";

    // email.text = "emiey5353@gmail.com";
    // password.text = "bujangfood2023";

    // email.text = " ain23.lagenda@gmail.com";
    // password.text = "armada2023";

    await setupCompany();
    super.onInit();
  }

  Future<void> setupCompany() async =>
      companies.value = await companyRepo.getCompany();

  onSelected(String value) {
    tenantId = companies
        .where((element) => element.companyName.contains(value))
        .first
        .id;
    logo.value = companies
            .where((element) => element.companyName.contains(value))
            .first
            .logoPath ??
        "";
    companyName = companies
        .where((element) => element.companyName.contains(value))
        .first
        .companyName;
    companyNameController.text = companyName;

    Get.find<Network>().setTenant(tenantId);
  }

  next() async {
    Get.find<Network>().setTenant(tenantId);
    Get.find<Storage>().setTenant = tenantId;
    Get.find<Storage>().setCompanyName = companyName;
    // Storage().setTenant = tenantId;
    // Storage().setCompanyName = companyName;
    isOtherMethod.value = !isOtherMethod.value;
    animatedWidget.value = LoginField(controller: this);
    // logo.value = "$cloudPath${company?.logoPath}";
  }

  submitLogin() async {
    EasyLoading.show();
    LoginRequest request =
        LoginRequest(email: email.text, password: password.text);
    LoginModel? res = await authRepo.login(request);
    EasyLoading.dismiss();

    if (res.user != null) {
      Get.find<Storage>().setPassword = password.text;
      Get.toNamed(HomeLayout.route);
    } else {
      Get.defaultDialog(
        title: res.message!,
        middleText: "Wrong email/password!",
      );
    }
  }

  changeLoginMethod() {
    isOtherMethod.value = !isOtherMethod.value;

    if (isOtherMethod.value) {
      animatedWidget.value = CompanyField(controller: this);
      Get.find<Network>().setTenant(tenantId);
      Get.find<Storage>().setTenant = tenantId;
      Get.find<Storage>().setCompanyName = companyName;
      // Storage().setTenant = tenantId;
      // Storage().setCompanyName = companyName;
    } else {
      animatedWidget.value = LoginField(controller: this);
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:myezhr/models/company/company.dart';
import 'package:myezhr/pages/login/controller.dart';
import 'package:myezhr/utils/network.dart';
import 'package:myezhr/utils/theme.dart';
import 'package:myezhr/widgets/button.dart';

class Login extends GetView<LoginController> {
  static String route = '/login';

  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height,
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.expand,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: SvgPicture.asset(
                    'assets/svg/Bg-top.svg',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Column(
                  children: [
                    Obx(
                      () => controller.logo.value == ""
                          ? const MyEzHrLogo()
                          : Container(
                              height: 250,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Image.network(
                                cloudPath + controller.logo.value,
                              ),
                            ),
                    ),
                    const WelcomeText(),
                    Obx(
                      () => AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: controller.animatedWidget.value,
                        transitionBuilder: (child, animation) {
                          return ScaleTransition(
                              child: child, scale: animation);
                        },
                      ),
                    ),
                    Obx(
                      () => controller.isOtherMethod.value
                          ? AppButton(
                              onPressed: () => controller.next(),
                              title: "Next",
                              width: Get.width * 0.9,
                            )
                          : AppButton(
                              onPressed: controller.submitLogin,
                              title: "Login",
                              width: Get.width * 0.9,
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Row(
                        children: const <Widget>[
                          Expanded(child: Divider(thickness: 2)),
                          Text("OR"),
                          Expanded(child: Divider(thickness: 2)),
                        ],
                      ),
                    ),
                    Obx(
                      () => AppButton(
                        onPressed: () => controller.changeLoginMethod(),
                        title: (controller.isOtherMethod.value
                            ? "Login with username"
                            : "Login with other company"),
                        width: Get.width * 0.9,
                        color: Colors.white,
                        borderColor: AppColor.primary,
                        style: TextStyle(color: AppColor.primary),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: FractionalOffset.bottomLeft,
                child: SvgPicture.asset(
                  'assets/svg/Bg-bottom.svg',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginField extends StatelessWidget {
  const LoginField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: PrimaryTextField(
            title: "Email",
            controller: controller.email,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: PrimaryTextField(
            title: "Password",
            controller: controller.password,
            obscureText: true,
          ),
        ),
        const ForgotPassword(),
      ],
    );
  }
}

class CompanyField extends StatelessWidget {
  const CompanyField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: Get.width * 0.9,
      height: 50,
      child: TypeAheadField<Company>(
        textFieldConfiguration: TextFieldConfiguration(
          controller: controller.companyNameController,
          autofocus: true,
          decoration: InputDecoration(border: OutlineInputBorder()),
        ),
        suggestionsCallback: (pattern) async {
          return controller.companies
              .where((p0) => p0.companyName.toLowerCase().contains(pattern));
        },
        itemBuilder: (context, suggestion) {
          return ListTile(
            leading: Icon(Icons.location_city_rounded),
            title: Text(suggestion.companyName),
          );
        },
        onSuggestionSelected: (suggestion) {
          controller.onSelected(suggestion.companyName);
        },
      ),
      // child: RawAutocomplete(
      //   optionsBuilder: (TextEditingValue textEditingValue) {
      //     if (textEditingValue.text == '') {
      //       return const Iterable<String>.empty();
      //     } else {
      //       List<String> matches = <String>[];
      //       matches.addAll(
      //         controller.companies.map((element) => element.companyName).toList(),
      //       );

      //       matches.retainWhere((s) {
      //         return s.toLowerCase().contains(textEditingValue.text.toLowerCase());
      //       });
      //       return matches;
      //     }
      //   },
      //   fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, FocusNode focusNode, VoidCallback onFieldSubmitted) {
      //     return TextField(
      //       decoration: InputDecoration(
      //         suffixIcon: GestureDetector(
      //           onTap: () => textEditingController.clear(),
      //           child: const Icon(Icons.close_rounded),
      //         ),
      //         floatingLabelBehavior: FloatingLabelBehavior.always,
      //         contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      //         hintText: "Enter Your Company Name",
      //         enabledBorder: OutlineInputBorder(
      //           borderRadius: BorderRadius.circular(10),
      //           borderSide: const BorderSide(color: Color(0xffE2E3E4)),
      //         ),
      //         focusedBorder: OutlineInputBorder(
      //           borderRadius: BorderRadius.circular(10),
      //           borderSide: const BorderSide(color: Color(0xffE2E3E4)),
      //         ),
      //       ),
      //       controller: textEditingController,
      //       focusNode: focusNode,
      //       onSubmitted: controller.onSelected,
      //     );
      //   },
      //   onSelected: controller.onSelected,
      //   optionsViewBuilder: (BuildContext context, void Function(String) onSelected, Iterable<String> options) {
      //     return SizedBox(
      //       height: 10,
      //       child: Column(
      //         children: options.map((opt) {
      //           return InkWell(
      //               onTap: () {
      //                 onSelected(opt);
      //               },
      //               child: Container(
      //                 color: Colors.white,
      //                 padding: EdgeInsets.only(right: 60),
      //                 child: Container(
      //                   width: double.infinity,
      //                   padding: EdgeInsets.all(10),
      //                   child: Text(opt),
      //                 ),
      //               ));
      //         }).toList(),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.fromLTRB(0, 10, 20, 20),
      child: InkWell(
        onTap: () => {},
        child: const Text(
          "Forgot Password?",
          style: TextStyle(
            color: Color(0xFFFF453A),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          alignment: Alignment.center,
          child: Text(
            'Welcome!',
            style: TextStyle(
              fontSize: 30,
              color: AppColor.tertiary,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          alignment: Alignment.center,
          child: Transform.scale(
            scaleY: 1.1,
            child: Text(
              "Let's sign you in",
              style: TextStyle(
                fontSize: 18,
                color: AppColor.tertiary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class PrimaryTextField extends StatelessWidget {
  PrimaryTextField({
    Key? key,
    required this.controller,
    required this.title,
    this.obscureText,
  }) : super(key: key);

  final TextEditingController controller;
  final String title;
  bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.9,
      height: 50,
      child: TextField(
        obscureText: obscureText ?? false,
        controller: controller,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          hintText: title,
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xffE2E3E4)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xffE2E3E4)),
          ),
        ),
      ),
    );
  }
}

class MyEzHrLogo extends StatelessWidget {
  const MyEzHrLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/Logo.png',
      scale: 4,
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: Get.size.height * 0.2,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Image.asset(
          'assets/images/Ellipse.png',
          color: AppColor.primary,
        ),
      ),
    );
  }
}

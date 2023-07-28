// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:myezhr/pages/login/controller.dart';
// import 'package:myezhr/utils/theme.dart';

// class Login extends GetView<LoginController> {
//   static String route = '/login';

//   const Login({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.background,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const Header(),
//             const MyEzHrLogo(),
//             const WelcomeText(),
//             Padding(
//               padding: const EdgeInsets.only(top: 30),
//               child: PrimaryTextField(
//                 title: "Username",
//                 controller: controller.username,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 30),
//               child: PrimaryTextField(
//                 title: "Password",
//                 controller: controller.password,
//                 obscureText: true,
//               ),
//             ),
//             const ForgotPassword(),
//             SizedBox(
//               width: Get.width * 0.9,
//               child: ElevatedButton(
//                 style: ButtonStyle(
//                   padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
//                   shape: MaterialStateProperty.all(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                   ),
//                 ),
//                 onPressed: () => controller.submitLogin(),
//                 child: Text(
//                   "Login",
//                   style: AppStyle().button,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ForgotPassword extends StatelessWidget {
//   const ForgotPassword({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.centerRight,
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//       child: InkWell(
//         onTap: () => {},
//         child: Text(
//           "Forgot Password?",
//           style: TextStyle(
//             color: AppColor.primary,
//             fontSize: 17,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class WelcomeText extends StatelessWidget {
//   const WelcomeText({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 15),
//           alignment: Alignment.centerLeft,
//           child: Text(
//             'Welcome!',
//             style: TextStyle(
//               fontSize: 50,
//               color: AppColor.tertiary,
//             ),
//           ),
//         ),
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//           alignment: Alignment.centerLeft,
//           child: Text(
//             "Let's sign you in",
//             style: TextStyle(
//               fontSize: 24,
//               color: AppColor.tertiary,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// // ignore: must_be_immutable
// class PrimaryTextField extends StatelessWidget {
//   PrimaryTextField({
//     Key? key,
//     required this.controller,
//     required this.title,
//     this.obscureText,
//   }) : super(key: key);

//   final TextEditingController controller;
//   final String title;
//   bool? obscureText;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: Get.width * 0.9,
//       height: 50,
//       child: TextField(
//         obscureText: obscureText ?? false,
//         controller: controller,
//         decoration: InputDecoration(
//           floatingLabelBehavior: FloatingLabelBehavior.always,
//           contentPadding:
//               const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//           hintText: title,
//           hintStyle: const TextStyle(
//             fontWeight: FontWeight.w600,
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: const BorderSide(color: Color(0xffE2E3E4)),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: const BorderSide(color: Color(0xffE2E3E4)),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MyEzHrLogo extends StatelessWidget {
//   const MyEzHrLogo({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 30),
//       child: Image.asset(
//         'assets/images/logo.png',
//       ),
//     );
//   }
// }

// class Header extends StatelessWidget {
//   const Header({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       height: Get.size.height * 0.2,
//       child: FittedBox(
//         fit: BoxFit.fill,
//         child: Image.asset(
//           'assets/images/Ellipse.png',
//         ),
//       ),
//     );
//   }
// }

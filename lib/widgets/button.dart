import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myezhr/utils/theme.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  AppButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.contentPadding,
    this.color,
    this.width,
    this.style,
    this.borderColor,
  }) : super(key: key);

  final Function onPressed;
  final String title;
  EdgeInsets? contentPadding;
  Color? color = AppColor.primary;
  Color? borderColor;
  double? width = Get.width * 0.5;
  TextStyle? style = AppStyle().button;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          side: MaterialStateProperty.all(
            BorderSide(
                color: borderColor ?? Colors.transparent,
                width: 1.0,
                style: BorderStyle.solid),
          ),
          backgroundColor: MaterialStateProperty.all(color),
          padding: MaterialStateProperty.all(
              contentPadding ?? const EdgeInsets.symmetric(vertical: 13)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        onPressed: () => onPressed(),
        child: Text(
          title,
          style: style,
        ),
      ),
    );
  }
}

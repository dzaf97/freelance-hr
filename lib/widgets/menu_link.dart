import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MenuLink extends StatelessWidget {
  const MenuLink({
    Key? key,
    required this.image,
    required this.linkName,
    required this.onTap,
  }) : super(key: key);

  final SvgPicture image;
  final String linkName;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(11),
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 5,
                  offset: const Offset(2, 5),
                )
              ],
            ),
            child: image,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(linkName),
          )
        ],
      ),
    );
  }
}

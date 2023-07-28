import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:myezhr/utils/network.dart';
import 'package:photo_view/photo_view.dart';

class AttendanceBox extends StatelessWidget {
  const AttendanceBox({
    Key? key,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.attachmentIn,
    required this.attachmentOut,
  }) : super(key: key);

  final String date;
  final String startTime;
  final String endTime;
  final String attachmentIn;
  final String attachmentOut;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 5,
              offset: const Offset(2, 5),
            )
          ],
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
              )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    date,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SvgPicture.asset('assets/svg/Dots.svg')
                ],
              )),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
            ),
            child: Row(
              children: [
                checkImage(attachmentIn, "in"),
                Column(
                  children: [
                    const Text("Start Time"),
                    Text(
                      startTime,
                      style: const TextStyle(
                        color: Color(0xFF27AE60),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    const Text("End Time"),
                    Text(
                      endTime,
                      style: const TextStyle(
                        color: Color(0xFFFF453A),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                checkImage(attachmentOut, "out")
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget checkImage(String attachment, String type) {
    if (attachment == "-") {
      return Container(
        width: 45,
        height: 45,
        margin: (type == "in")
            ? const EdgeInsets.only(right: 20)
            : const EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          color: const Color(0xFFD9D9D9),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text(""),
      );
    } else {
      return GestureDetector(
        onTap: () async =>
            (await Get.find<Network>().checkImage(url: cloudPath + attachment))
                ? Get.to(
                    () => ImageViewer(
                      attachment: attachment,
                      type: type,
                    ),
                  )
                : null,
        child: Hero(
          tag: "attendance-image" + attachment + type,
          child: Container(
            width: 45,
            height: 45,
            margin: (type == "in")
                ? const EdgeInsets.only(right: 20)
                : const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              color: const Color(0xFFD9D9D9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: FutureBuilder(
              initialData: false,
              future:
                  Get.find<Network>().checkImage(url: cloudPath + attachment),
              builder: (BuildContext context, AsyncSnapshot<bool> imageok) {
                if (imageok.data!) {
                  return Image.network(cloudPath + attachment);
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),
      );
    }
  }
}

class ImageViewer extends StatelessWidget {
  const ImageViewer({
    Key? key,
    required this.attachment,
    required this.type,
  }) : super(key: key);

  final String attachment;
  final String type;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {},
      onHorizontalDragUpdate: (details) {
        if (details.delta.direction <= 0) {
          Get.back();
        }
      },
      child: Hero(
        tag: "attendance-image" + attachment + type,
        child: PhotoView(imageProvider: NetworkImage(cloudPath + attachment)),
      ),
    );
  }
}

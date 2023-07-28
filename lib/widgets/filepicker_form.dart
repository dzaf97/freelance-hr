import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myezhr/utils/theme.dart';

class FormFilePicker extends StatelessWidget {
  const FormFilePicker({
    Key? key,
    required this.title,
    required this.file,
  }) : super(key: key);

  final String title;
  final Rx<File> file;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Get.defaultDialog(
          title: "Select attachment source",
          titlePadding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconWIthName(
                onTap: () async {
                  final ImagePicker picker = ImagePicker();
                  var image =
                      await picker.pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    File _file = File(image.path);
                    file.value = _file;
                  }
                  Get.back();
                },
                icon: Icons.image,
                title: "Image",
              ),
              IconWIthName(
                onTap: () async {
                  final ImagePicker picker = ImagePicker();
                  var image =
                      await picker.pickImage(source: ImageSource.camera);
                  if (image != null) {
                    File _file = File(image.path);
                    file.value = _file;
                  }
                  Get.back();
                },
                icon: Icons.camera_alt,
                title: "Camera",
              ),
              IconWIthName(
                onTap: () async {
                  Get.back();
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles();

                  if (result != null) {
                    File _file = File(result.files.single.path!);
                    file.value = _file;
                  }
                },
                icon: Icons.file_present,
                title: "File",
              ),
            ],
          ),
        );
      },
      child: Container(
        width: Get.width * 0.9,
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                title,
                style: const TextStyle(color: Color(0xFF686777)),
              ),
            ),
            Obx(
              () => TextField(
                enabled: false,
                decoration: InputDecoration(
                  suffixIcon: const ImageIcon(
                    AssetImage('assets/images/File.png'),
                    color: Color(0xFF686777),
                    size: 1,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  hintText: file.value.path.split('/').last,
                  hintStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xffE2E3E4)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class IconWIthName extends StatelessWidget {
  const IconWIthName({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final Function() onTap;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            icon,
            size: 40,
            color: AppColor.primary,
          ),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}

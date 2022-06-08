import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/core/colors.dart';

Widget defaultFormField(
    {required TextEditingController textEditingController,
    required String? Function(String?)? validator,
    required String hint}) {
  return TextFormField(
    style: TextStyle(color: MainColors.accent, fontSize: Get.width * 0.045),
    controller: textEditingController,
    validator: validator,
    decoration: InputDecoration(
      hintStyle:
          TextStyle(color: MainColors.accent, fontSize: Get.width * 0.045),
      hintText: hint,
    ),
  );
}

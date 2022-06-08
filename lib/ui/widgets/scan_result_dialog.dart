import 'package:flutter/material.dart';
import 'package:get/get.dart';

scanResultDialog({required String result}) => Get.defaultDialog(
      title: 'QR code result',
      backgroundColor: Colors.white,
      content: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(Get.width * 0.06),
        child: Text(result),
      ),
    );

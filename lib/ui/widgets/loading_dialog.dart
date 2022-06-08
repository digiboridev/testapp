import 'package:flutter/material.dart';
import 'package:get/get.dart';

loadingDialog() => Get.defaultDialog(
    onWillPop: () async => false,
    title: 'Loading',
    barrierDismissible: false,
    backgroundColor: Colors.white,
    content: Container(
        alignment: Alignment.center, child: CircularProgressIndicator()));

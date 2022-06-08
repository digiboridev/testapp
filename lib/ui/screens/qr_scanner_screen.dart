import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:testapp/core/logger.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({Key? key}) : super(key: key);

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
      )),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    // Restart camera on init, fixes black screen
    resuecamara();
    // Return result immidiently after qr recognized
    try {
      controller.scannedDataStream.first
          .then((scanData) => Get.back(result: scanData.code));
    } catch (e) {
      log(e);
    }
  }

  void resuecamara() {
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

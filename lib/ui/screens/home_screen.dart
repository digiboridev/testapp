import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/core/colors.dart';
import 'package:testapp/ui/screens/qr_scanner_screen.dart';
import 'package:testapp/ui/widgets/scan_result_dialog.dart';

class HomeScreen extends StatelessWidget {
  final Function signOut;
  final String userId;
  const HomeScreen({Key? key, required this.signOut, required this.userId})
      : super(key: key);

  // Opens QR Scanner and show result on scan complete
  onScan() async {
    String? scanResult = await Get.to(() => QrScannerScreen());
    if (scanResult is String) {
      scanResultDialog(result: scanResult);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox.expand(
        child: Column(
          children: [
            buildHeader(),
            Spacer(),
            buildQrButton(),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      )),
    );
  }

  Widget buildQrButton() {
    return GestureDetector(
      onTap: () => onScan(),
      child: Container(
        height: Get.width * 0.75,
        width: Get.width * 0.75,
        decoration: BoxDecoration(
            color: MainColors.accent,
            borderRadius: BorderRadius.circular(Get.width * 0.08)),
        child: Icon(
          Icons.qr_code,
          color: Colors.white,
          size: Get.width * 0.5,
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Container(
      color: MainColors.background,
      padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.06, vertical: Get.width * 0.04),
      child: Row(
        children: [
          Text(
            'User id: ',
            style: TextStyle(color: Colors.black, fontSize: Get.width * 0.03),
          ),
          Text(
            userId,
            style: TextStyle(color: Colors.black, fontSize: Get.width * 0.03),
          ),
          Spacer(),
          GestureDetector(
            onTap: () => signOut(),
            child: Container(
              decoration: BoxDecoration(
                  color: MainColors.accent,
                  borderRadius: BorderRadius.circular(Get.width * 0.03)),
              padding: EdgeInsets.all(Get.width * 0.02),
              child: Text(
                'Logout',
                style:
                    TextStyle(color: Colors.white, fontSize: Get.width * 0.03),
              ),
            ),
          )
        ],
      ),
    );
  }
}

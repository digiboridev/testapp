import 'package:flutter/material.dart';

class JustLoadingScreen extends StatelessWidget {
  const JustLoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: const CircularProgressIndicator(),
      )),
    );
  }
}

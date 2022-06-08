import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:testapp/core/firebase_options.dart';
import 'package:testapp/core/logger.dart';
import 'package:testapp/data/services/firebase_auth_service.dart';
import 'package:testapp/ui/controllers/auth/auth_controller.dart';
import 'package:testapp/ui/screens/auth_wrapper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await initServices();
  await initControllers();

  runApp(GetMaterialApp(
    home: AuthWrapper(),
  ));
}

Future initServices() async {
  log('starting services ...');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(FireAuthService(firebaseAuthInstanse: FirebaseAuth.instance),
      permanent: true);
  log('All services started...');
}

Future initControllers() async {
  log('starting services ...');
  Get.put(AuthController(), permanent: true);
  log('All controllers started...');
}

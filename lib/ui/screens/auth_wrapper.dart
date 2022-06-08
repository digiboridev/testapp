import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/ui/controllers/auth/auth_controller.dart';
import 'package:testapp/ui/controllers/auth/auth_states.dart';
import 'package:testapp/ui/screens/home_screen.dart';
import 'package:testapp/ui/screens/just_loading_screen.dart';
import 'package:testapp/ui/screens/sign_in_screen.dart';
import 'package:testapp/ui/screens/sign_up_screen.dart';

// That widget returns screens based auth state
class AuthWrapper extends StatelessWidget {
  AuthWrapper({Key? key}) : super(key: key);

  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      AuthState authState = _authController.authState;

      if (authState is AuthStateSignIn) {
        return SignInScreen(
          signInWithEmail: authState.signInWithEmail,
          switchToSignUp: authState.switchToSignUp,
        );
      }

      if (authState is AuthStateSignUp) {
        return SignUpScreen(
          signUpWithEmail: authState.signUpWithEmail,
          switchToSignIn: authState.switchToSignIn,
        );
      }

      if (authState is AuthStateAuthentificated) {
        return HomeScreen(
          signOut: authState.signOut,
          userId: authState.userUuid,
        );
      }

      return JustLoadingScreen();
    });
  }
}

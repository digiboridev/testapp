import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:testapp/core/logger.dart';
import 'package:testapp/data/services/firebase_auth_service.dart';
import 'package:testapp/ui/controllers/auth/auth_states.dart';
import 'package:testapp/ui/widgets/loading_dialog.dart';

class AuthController extends GetxController {
  //Dependencies
  final FireAuthService _fireAuthService = Get.find();

  // Variables
  final Rx<AuthState> _authState = Rx(AuthStateInitial());
  AuthState get authState => _authState.value;

  late final StreamSubscription _authSub;

  @override
  void onReady() {
    super.onReady();

    // Bind state to firebase auth
    mapAuthChangesToState(user: _fireAuthService.user);
    _authSub = _fireAuthService.userStream
        .listen((user) => mapAuthChangesToState(user: user));
  }

  // Handle auth changes
  mapAuthChangesToState({required User? user}) {
    if (user == null) {
      _authState.value = AuthStateSignIn(
        switchToSignUp: _switchToSignUp,
        signInWithEmail: _signInWithEmail,
      );
    } else {
      _authState.value = AuthStateAuthentificated(
          userUuid: user.uid, signOut: () => _fireAuthService.signOut());
    }
  }

  _switchToSignIn() {
    _authState.value = AuthStateSignIn(
      switchToSignUp: _switchToSignUp,
      signInWithEmail: _signInWithEmail,
    );
  }

  _switchToSignUp() {
    _authState.value = AuthStateSignUp(
      switchToSignIn: _switchToSignIn,
      signUpWithEmail: _signUpWithEmail,
    );
  }

  Future _signInWithEmail(
      {required String email, required String password}) async {
    // Show loading dialog
    loadingDialog();

    // Try to sign
    try {
      await _fireAuthService.signInByEmail(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      Get.snackbar('Error', e.code);
    } catch (e) {
      log(e.toString());
      Get.snackbar('Error', e.toString());
    }

    // Close loading dialog
    Get.until((route) => !Get.isDialogOpen!);
  }

  Future _signUpWithEmail(
      {required String email, required String password}) async {
    // Show loading dialog
    loadingDialog();

    // Try to sign
    try {
      await _fireAuthService.signUpByEmail(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      Get.snackbar('Error', e.code);
    } catch (e) {
      log(e.toString());
      Get.snackbar('Error', e.toString());
    }

    // Close loading dialog
    Get.until((route) => !Get.isDialogOpen!);
  }

  @override
  void onClose() {
    super.onClose();
    _authSub.cancel();
  }
}

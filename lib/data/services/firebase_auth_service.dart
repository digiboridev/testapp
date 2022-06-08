import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

class FireAuthService {
  FireAuthService({
    required FirebaseAuth firebaseAuthInstanse,
  }) : _firebaseAuthInstanse = firebaseAuthInstanse;

  late final FirebaseAuth _firebaseAuthInstanse;

  User? get user => _firebaseAuthInstanse.currentUser;
  Stream<User?> get userStream =>
      _firebaseAuthInstanse.userChanges().asBroadcastStream();

  Future signUpByEmail(
      {required String email, required String password}) async {
    UserCredential userCredential = await _firebaseAuthInstanse
        .createUserWithEmailAndPassword(email: email, password: password);

    return userCredential;
  }

  Future<UserCredential> signInByEmail(
      {required String email, required String password}) async {
    UserCredential userCredential = await _firebaseAuthInstanse
        .signInWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

  Future<UserCredential> signInAnonymously() async {
    return await _firebaseAuthInstanse.signInAnonymously();
  }

  Future signOut() async {
    await _firebaseAuthInstanse.signOut();
  }
}

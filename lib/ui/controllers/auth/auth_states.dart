abstract class AuthState {}

class AuthStateInitial extends AuthState {}

class AuthStateAuthentificated extends AuthState {
  final String userUuid;
  final Function signOut;
  AuthStateAuthentificated({
    required this.userUuid,
    required this.signOut,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthStateAuthentificated && other.userUuid == userUuid;
  }

  @override
  int get hashCode => userUuid.hashCode;

  @override
  String toString() => 'AuthStateAuthentificated(userUuid: $userUuid)';
}

abstract class AuthStateUnAuthentificated extends AuthState {}

class AuthStateSignIn extends AuthStateUnAuthentificated {
  final Future Function({
    required String email,
    required String password,
  }) signInWithEmail;

  final Function switchToSignUp;

  AuthStateSignIn(
      {required this.switchToSignUp, required this.signInWithEmail});
}

class AuthStateSignUp extends AuthStateUnAuthentificated {
  final Future Function({
    required String email,
    required String password,
  }) signUpWithEmail;

  final Function switchToSignIn;

  AuthStateSignUp({
    required this.switchToSignIn,
    required this.signUpWithEmail,
  });
}

import 'package:get/get.dart';

String? emailValidator(val) {
  if (val != null && val.isNotEmpty) {
    return GetUtils.isEmail(val) ? null : 'Incorrect email';
  } else {
    return 'Email is empty';
  }
}

String? passwordValidator(val) {
  if (val != null && val.isNotEmpty) {
    if (val.length > 8) {
      return 'Password to long';
    }
    if (val.length < 4) {
      return 'Password to short';
    }
    return null;
  } else {
    return 'Password is empty';
  }
}

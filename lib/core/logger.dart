import 'package:flutter/foundation.dart';

log(dynamic message) {
  if (kDebugMode) {
    print(message);
  }
}

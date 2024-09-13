import 'package:flutter/foundation.dart';

class Log {
  Log._();

  static void i(Object? message) {
    if (kDebugMode) {
      print(message);
    }
  }
}

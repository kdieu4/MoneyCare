import 'package:flutter/foundation.dart';

void logD(message) {
  if (kDebugMode) {
    print("+++++++++++++");
    print(message);
  }
}
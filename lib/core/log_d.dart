import 'package:flutter/foundation.dart';

void logD(tag, message) {
  if (kDebugMode) {
    print("$tag +++++++++++++");
    print(message);
  }
}

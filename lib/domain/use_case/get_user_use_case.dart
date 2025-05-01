import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:money_care/core/service_locator.dart';
import 'package:money_care/domain/repository/user_repository.dart';

class GetUserUseCase {
  final UserRepository userRepository = getIt.get();

  void call(ValueChanged<User?> onUserChange) =>
      userRepository.getCurrUser(onUserChange);
}

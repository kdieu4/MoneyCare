import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:money_care/domain/entity/my_user_info.dart';

abstract class UserRepository {
  void getCurrUser(ValueChanged<User?> onUserChange);

  Future<void> createUser(MyUserInfo userInfo);

  Future<UserCredential> signInWithGoogle();
}

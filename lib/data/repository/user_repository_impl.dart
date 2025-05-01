import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:money_care/core/log_d.dart';
import 'package:money_care/domain/entity/my_user_info.dart';
import 'package:money_care/domain/repository/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  @override
  void getCurrUser(ValueChanged<User?> onUserChange) {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      onUserChange(user);
    });
  }

  @override
  Future<void> createUser(MyUserInfo userInfo) async {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: userInfo.email,
          password: userInfo.password,
        );
    logD(credential);
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:money_care/core/log_d.dart';
import 'package:money_care/domain/entity/my_user_info.dart';
import 'package:money_care/domain/repository/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final tag = "UserRepositoryImpl";

  final StreamController<User?> userController =
      StreamController<User?>.broadcast();

  @override
  Stream<User?>? getCurrUser() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      userController.sink.add(user);
    });
    return userController.stream;
  }

  @override
  Future<UserCredential> createEmailAndPassword(MyUserInfo userInfo) async {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: userInfo.email,
          password: userInfo.password,
        );
    logD(tag, credential);
    return credential;
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    if (kIsWeb) {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();
      return await FirebaseAuth.instance.signInWithPopup(googleProvider);
    }

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Future<UserCredential> signEmailAndPassword(MyUserInfo userInfo) async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: userInfo.email,
      password: userInfo.password,
    );
    return credential;
  }

  @override
  Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
  }
}

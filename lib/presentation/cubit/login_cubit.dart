import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_care/core/log_d.dart';
import 'package:money_care/domain/use_case/email_login_use_case.dart';
import 'package:money_care/domain/use_case/get_user_use_case.dart';
import 'package:money_care/domain/use_case/google_login_use_case.dart';

class LoginCubit extends Cubit<LoginState> {
  final tag = "LoginCubit";
  final GetUserUseCase getUserUseCase;
  final GoogleLoginUseCase googleLoginUseCase;
  final EmailLoginUseCase emailLoginUseCase;

  LoginCubit(
    this.getUserUseCase,
    this.googleLoginUseCase,
    this.emailLoginUseCase,
  ) : super(NotLogIn()) {
    getUser();
  }

  Future<void> getUser() async {
    logD(tag, "getUser kIsWeb $kIsWeb");
    Stream<User?>? userStream = getUserUseCase();
    if (userStream != null) {
      userStream.listen((user) {
        if (!isClosed) {
          if (user == null) {
            emit(NotLogIn());
          } else {
            emit(LogIn(user));
          }
        }
      });
    }
  }

  Future<void> googleLogin() async {
    try {
      UserCredential userCredential = await googleLoginUseCase();
      if (userCredential.user != null) {
        emit(LogIn(userCredential.user!));
      }
    } catch (e) {
      logD(tag, "googleLogin $e");
      emit(NotLogIn());
    }
  }

  Future<void> emailLogin(String email, String password) async {
    try {
      UserCredential userCredential = await emailLoginUseCase(email, password);
      if (userCredential.user != null) {
        emit(LogIn(userCredential.user!));
      }
    } catch (e) {
      logD(tag, "emailLogin $e");
      emit(NotLogIn());
    }
  }

  Future<void> emailSignUp(String email, String password) async {
    try {
      UserCredential userCredential = await emailLoginUseCase(email, password);
      if (userCredential.user != null) {
        emit(LogIn(userCredential.user!));
      }
    } catch (e) {
      logD(tag, "emailLogin $e");
      emit(NotLogIn());
    }
  }

  Future<void> logOut() async {
    await getUserUseCase.logOut();
  }
}

abstract class LoginState {}

class NotLogIn extends LoginState {}

class LogIn extends LoginState {
  final User user;

  LogIn(this.user);
}

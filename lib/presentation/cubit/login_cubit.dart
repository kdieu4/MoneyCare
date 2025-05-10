import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_care/core/log_d.dart';
import 'package:money_care/core/service_locator.dart';
import 'package:money_care/domain/use_case/get_user_use_case.dart';
import 'package:money_care/domain/use_case/google_login_use_case.dart';

class LoginCubit extends Cubit<LoginState> {
  final GetUserUseCase getUserUseCase = getIt.get();
  final GoogleLoginUseCase googleLoginUseCase = getIt.get();

  LoginCubit() : super(NotLogIn()) {
    getUser();
  }

  Future<void> getUser() async {
    logD("kIsWeb $kIsWeb");
    getUserUseCase((user) {
      logD(user);
      if (user != null) {
        emit(LogIn(user));
      }
    });
  }

  Future<void> googleLogin() async {
    try {
      UserCredential userCredential = await googleLoginUseCase();
      if (userCredential.user != null) {
        emit(LogIn(userCredential.user!));
      }
    } catch (e) {
      emit(NotLogIn());
    }
  }
}

abstract class LoginState {}

class NotLogIn extends LoginState {}

class LogIn extends LoginState {
  final User user;

  LogIn(this.user);
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:money_care/core/service_locator.dart';
import 'package:money_care/domain/repository/user_repository.dart';

class GoogleLoginUseCase {
  final UserRepository userRepository = getIt.get();

  Future<UserCredential> call() => userRepository.signInWithGoogle();
}

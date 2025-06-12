import 'package:firebase_auth/firebase_auth.dart';
import 'package:money_care/domain/repository/user_repository.dart';

class GoogleLoginUseCase {
  final UserRepository userRepository;

  GoogleLoginUseCase(this.userRepository);

  Future<UserCredential> call() => userRepository.signInWithGoogle();
}

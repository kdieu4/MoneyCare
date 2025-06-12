import 'package:firebase_auth/firebase_auth.dart';
import 'package:money_care/domain/entity/my_user_info.dart';
import 'package:money_care/domain/repository/user_repository.dart';

class EmailLoginUseCase {
  final UserRepository userRepository;

  EmailLoginUseCase(this.userRepository);

  Future<UserCredential> call(String email, String password) => userRepository
      .createEmailAndPassword(MyUserInfo(email: email, password: password));

  Future<UserCredential> signIn(String email, String password) => userRepository
      .signEmailAndPassword(MyUserInfo(email: email, password: password));
}

import 'package:money_care/domain/repository/user_repository.dart';

class GetUserUseCase {
  final UserRepository userRepository;

  GetUserUseCase(this.userRepository);

  call() => userRepository.getCurrUser();

  logOut() => userRepository.signOut();
}

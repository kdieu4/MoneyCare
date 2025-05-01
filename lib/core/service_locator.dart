import 'package:get_it/get_it.dart';
import 'package:money_care/data/repository/user_repository_impl.dart';
import 'package:money_care/domain/repository/user_repository.dart';
import 'package:money_care/domain/use_case/get_user_use_case.dart';
import 'package:money_care/domain/use_case/google_login_use_case.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());
  getIt.registerFactory(() => GetUserUseCase());
  getIt.registerFactory(() => GoogleLoginUseCase());
}

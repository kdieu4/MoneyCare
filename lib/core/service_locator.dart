import 'package:get_it/get_it.dart';
import 'package:money_care/data/repository/book_series_repository_impl.dart';
import 'package:money_care/data/repository/user_repository_impl.dart';
import 'package:money_care/domain/repository/book_series_repository.dart';
import 'package:money_care/domain/repository/user_repository.dart';
import 'package:money_care/domain/use_case/book_series_use_case.dart';
import 'package:money_care/domain/use_case/get_user_use_case.dart';
import 'package:money_care/domain/use_case/google_login_use_case.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());
  getIt.registerLazySingleton<BookSeriesRepository>(
    () => BookSeriesRepositoryImpl(),
  );
  getIt.registerFactory(() => GetUserUseCase());
  getIt.registerFactory(() => GoogleLoginUseCase());
  getIt.registerFactory(() => BookSeriesUseCase());
}

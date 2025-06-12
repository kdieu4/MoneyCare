import 'package:get_it/get_it.dart';
import 'package:money_care/data/repository/book_series_repository_impl.dart';
import 'package:money_care/data/repository/user_repository_impl.dart';
import 'package:money_care/domain/repository/book_series_repository.dart';
import 'package:money_care/domain/repository/user_repository.dart';
import 'package:money_care/domain/use_case/book_series_use_case.dart';
import 'package:money_care/domain/use_case/get_user_use_case.dart';
import 'package:money_care/domain/use_case/google_login_use_case.dart';

import '../domain/use_case/email_login_use_case.dart';
import '../presentation/cubit/login_cubit.dart';
import '../presentation/cubit/money_cubit.dart';
import '../presentation/cubit/one_piece_cubit.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());
  getIt.registerLazySingleton<BookSeriesRepository>(
    () => BookSeriesRepositoryImpl(),
  );

  getIt.registerFactory(() => GetUserUseCase(getIt.get()));
  getIt.registerFactory(() => GoogleLoginUseCase(getIt.get()));
  getIt.registerFactory(() => BookSeriesUseCase(getIt.get()));
  getIt.registerFactory(() => EmailLoginUseCase(getIt.get()));

  getIt.registerFactory(
    () => LoginCubit(getIt.get(), getIt.get(), getIt.get()),
  );

  getIt.registerFactory(() => OnePieceCubit(getIt.get()));
  getIt.registerFactory(() => MoneyCubit());
}

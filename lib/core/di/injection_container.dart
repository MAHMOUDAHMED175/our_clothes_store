//
// register refactor بتتعمل مع البلوك لانه بيستدعى اكتر من مره

// registerlazy singiltone  دى للحاجه اللى بتستدعى مره واحده

import 'package:get_it/get_it.dart';
import 'package:our_clothes_store/core/app/app_cubit/cubit/app_cubit_cubit.dart';
import 'package:our_clothes_store/core/services/graphql/api_service.dart';
import 'package:our_clothes_store/core/services/graphql/dio_factory.dart';
import 'package:our_clothes_store/features/auth/data/data_source/auth_data_source.dart';
import 'package:our_clothes_store/features/auth/data/repos/auth_repository.dart';
import 'package:our_clothes_store/features/auth/presentation/view_model/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> setupInjector() async {
  await _initCore();
  await _initAuth();
}

Future<void> _initCore() async {
  final dio = DioFactory.getDio();
  sl
    ..registerFactory(AppCubitCubit.new)
    ..registerLazySingleton<ApiService>(() => ApiService(dio));
}

Future<void> _initAuth() async {
  sl
    ..registerFactory<AuthBloc>(() => AuthBloc(sl()))
    ..registerLazySingleton<AuthRepository>(() => AuthRepository(sl()))
    ..registerLazySingleton<AuthDataSource>(() => AuthDataSource(sl()));
}

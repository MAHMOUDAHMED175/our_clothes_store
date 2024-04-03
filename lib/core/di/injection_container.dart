//
// register refactor بتتعمل مع البلوك لانه بيستدعى اكتر من مره

// registerlazy singiltone  دى للحاجه اللى بتستدعى مره واحده

import 'package:get_it/get_it.dart';
import 'package:our_clothes_store/core/app/app_cubit/cubit/app_cubit_cubit.dart';
import 'package:our_clothes_store/core/services/graphql/api_service.dart';
import 'package:our_clothes_store/core/services/graphql/dio_factory.dart';

final sl = GetIt.instance;

Future<void> setupInjector() async {
  final dio = DioFactory.getDio();
  sl..registerFactory(AppCubitCubit.new)
  ..registerLazySingleton<ApiService>(() => ApiService(dio));
}

import 'package:get_it/get_it.dart';
import 'package:mobile_test_task/core/core.dart';
import 'package:mobile_test_task/core/helpers/hive_helper.dart';
import 'package:mobile_test_task/data/data_sources/data.dart';
import 'package:mobile_test_task/data/repos/auth.dart';

import '../helpers/dio_helper.dart';
import '../network/network_call.dart';

final injector = GetIt.instance;

Future<void> initSingletons() async {
  //Services
  injector.registerLazySingleton<DioHelper>(() => DioHelper());
  injector.registerLazySingleton<NetworkCall>(() => injector<NetworkCall>());
  injector.registerLazySingleton<HiveHelper>(() => HiveHelper());
  injector.registerLazySingleton<AuthDataSource>(() => AuthDataSource());
  injector.registerLazySingleton<Validators>(() => Validators());
  injector.registerLazySingleton<AuthRepo>(
      () => AuthRepo(authDataSource: injector<AuthDataSource>()));

  //initiating db
}

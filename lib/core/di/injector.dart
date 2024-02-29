import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mobile_test_task/core/core.dart';
import 'package:mobile_test_task/core/helpers/hive_helper.dart';
import 'package:mobile_test_task/core/network/network_info.dart';
import 'package:mobile_test_task/data/data_sources/register.dart';
import 'package:mobile_test_task/data/repos/register.dart';

import '../helpers/dio_helper.dart';
import '../network/network_call.dart';

final injector = GetIt.instance;

Future<void> initSingletons() async {
  //Services
  injector.registerLazySingleton<DioHelper>(() => DioHelper());
  injector.registerLazySingleton<NetworkCall>(
      () => NetworkCall(dioHelper: injector<DioHelper>()));
  injector.registerLazySingleton<HiveHelper>(() => HiveHelper());
  injector.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());
  injector.registerLazySingleton<NetworkInfo>(() =>
      NetworkInfoImp(connectionChecker: injector<InternetConnectionChecker>()));

  injector.registerLazySingleton<AuthDataSource>(() => AuthDataSource());
  injector.registerLazySingleton<Validators>(() => Validators());
  injector.registerLazySingleton<AuthRepo>(() => AuthRepo(
      authDataSource: injector<AuthDataSource>(),
      networkInfo: injector<NetworkInfo>()));

  //initiating db
}

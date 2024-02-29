import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mobile_test_task/core/core.dart';
import 'package:mobile_test_task/data/data.dart';

final injector = GetIt.instance;

Future<void> initSingletons() async {
  //services
  injector.registerLazySingleton<DioHelper>(() => DioHelper());

  injector.registerLazySingleton<NetworkCall>(
      () => NetworkCall(dioHelper: injector<DioHelper>()));

  injector.registerLazySingleton<HiveHelper>(() => HiveHelper());

  injector.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());

  injector.registerLazySingleton<NetworkInfo>(() =>
      NetworkInfoImp(connectionChecker: injector<InternetConnectionChecker>()));

  injector.registerLazySingleton<Validators>(() => Validators());

  //register
  injector
      .registerLazySingleton<RegisterDataSource>(() => RegisterDataSource());
  injector.registerLazySingleton<RegisterRepo>(() => RegisterRepo(
      registerDataSource: injector<RegisterDataSource>(),
      networkInfo: injector<NetworkInfo>()));

  //log in
  injector.registerLazySingleton<LoginDataSource>(() => LoginDataSource());
  injector.registerLazySingleton<LoginRepo>(() => LoginRepo(
      loginDataSource: injector<LoginDataSource>(),
      networkInfo: injector<NetworkInfo>()));

  //update user
  injector.registerLazySingleton<UpdateUserDataSource>(
      () => UpdateUserDataSource());
  injector.registerLazySingleton<UpdateUserRepo>(() => UpdateUserRepo(
      updateUserDataSource: injector<UpdateUserDataSource>(),
      networkInfo: injector<NetworkInfo>()));
}

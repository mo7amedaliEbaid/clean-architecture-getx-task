import '../../core/core.dart';
import '../../models/models.dart';
import '../data.dart';
import 'package:dartz/dartz.dart';

class LoginRepo {
  NetworkInfo networkInfo;
  LoginDataSource loginDataSource;

  LoginRepo({
    required this.networkInfo,
    required this.loginDataSource,
  });

  Future<Either<Failure, UserModel?>> login({
    required String password,
    required String email,
  }) {
    return FailureHelper.instance(
      method: () async {
        return await loginDataSource.login(
          password: password,
          email: email,
        );
      },
      networkInfo: networkInfo,
    );
  }
}

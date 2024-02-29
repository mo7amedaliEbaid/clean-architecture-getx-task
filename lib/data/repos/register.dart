import '../../core/helpers/failure_helper.dart';
import '../../core/network/failures.dart';
import '../../core/network/network_info.dart';
import '../../models/user.dart';
import '../data_sources/register.dart';
import 'package:dartz/dartz.dart';

class AuthRepo {
  NetworkInfo networkInfo;
  AuthDataSource authDataSource;

  AuthRepo({required this.networkInfo, required this.authDataSource});

  Future<Either<Failure, UserModel?>> register({
    required String password,
    required String phone,
    required String email,
    required String name,
    required String passwordConfirmation,
    required String countryCode,
  }) {
    return FailureHelper.instance(
      method: () async {
        return await authDataSource.register(
          password: password,
          phone: phone,
          name: name,
          email: email,
          passwordConfirmation: passwordConfirmation,
          countryCode: countryCode,
        );
      },
      networkInfo: networkInfo,
    );
  }
}

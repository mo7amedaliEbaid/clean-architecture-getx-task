
import '../../core/core.dart';
import '../../models/models.dart';
import '../data.dart';
import 'package:dartz/dartz.dart';

class RegisterRepo {
  NetworkInfo networkInfo;
  RegisterDataSource registerDataSource;

  RegisterRepo({required this.networkInfo, required this.registerDataSource});

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
        return await registerDataSource.register(
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

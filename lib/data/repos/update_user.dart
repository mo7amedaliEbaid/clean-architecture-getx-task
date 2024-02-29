import '../../core/core.dart';
import '../../models/models.dart';
import '../data.dart';
import 'package:dartz/dartz.dart';

class UpdateUserRepo {
  NetworkInfo networkInfo;
  UpdateUserDataSource updateUserDataSource;

  UpdateUserRepo({
    required this.networkInfo,
    required this.updateUserDataSource,
  });

  Future<Either<Failure, UpdatedUser?>> updateUser({
    required String phone,
    required String email,
    required String name,
    required String countryCode,
  }) {
    return FailureHelper.instance(
      method: () async {
        return await updateUserDataSource.updateUser(
          phone: phone,
          name: name,
          email: email,
          countryCode: countryCode,
        );
      },
      networkInfo: networkInfo,
    );
  }
}

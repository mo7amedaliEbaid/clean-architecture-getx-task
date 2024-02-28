import '../../core/helpers/failure_helper.dart';
import '../../core/network/failures.dart';
import '../../models/user.dart';
import '../data_sources/data.dart';
import 'package:dartz/dartz.dart';

class AuthRepo {
  // NetworkInfo networkInfo;
  AuthDataSource authDataSource;

  AuthRepo({/*required this.networkInfo,*/ required this.authDataSource});
  Future<Either<Failure, UserModel?>> register(
      {required String code, required String password, required String phone}) {
    return FailureHelper.instance(
      method: () async {
        return await authDataSource.login(
            code: code, password: password, phone: phone);
      },
      //networkInfo: networkInfo,
    );}
  Future<Either<Failure, UserModel?>> login(
      {required String code, required String password, required String phone}) {
    return FailureHelper.instance(
      method: () async {
        return await authDataSource.login(
            code: code, password: password, phone: phone);
      },
      //networkInfo: networkInfo,
    );
  }
}

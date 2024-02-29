import 'package:dio/dio.dart';
import 'package:mobile_test_task/core/core.dart';
import 'package:mobile_test_task/models/models.dart';

class AuthDataSource {
  Future<UserModel?> register({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String countryCode,
  }) async {
    try {
      Map<String, dynamic> response =
          await injector<NetworkCall>().request(EndPoints.register,
              params: FormData.fromMap({
                'name': name,
                'phone': phone,
                'email': email,
                'password': password,
                'password_confirm': passwordConfirmation,
                'country_code': countryCode,
              }),
              options: Options(method: Method.post.name));
      return RegisterResponse.fromJson(response).data;
    } catch (error) {
      rethrow;
    }
  }
}

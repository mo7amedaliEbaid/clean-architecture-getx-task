import 'package:dio/dio.dart';
import 'package:mobile_test_task/core/core.dart';
import 'package:mobile_test_task/models/models.dart';

class LoginDataSource {
  Future<UserModel?> login({
    required String email,
    required String password,
  }) async {
    try {
      Map<String, dynamic> response =
          await injector<NetworkCall>().request(EndPoints.login,
              params: FormData.fromMap({
                'email': email,
                'password': password,
              }),
              options: Options(method: Method.post.name));
      return AuthResponse.fromJson(response).data;
    } catch (error) {
      rethrow;
    }
  }
}

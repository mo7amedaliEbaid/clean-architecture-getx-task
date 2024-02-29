import 'package:dio/dio.dart';
import 'package:mobile_test_task/core/core.dart';
import 'package:mobile_test_task/models/models.dart';

class UpdateUserDataSource {
  Future<UpdatedUser?> updateUser({
    required String name,
    required String phone,
    required String email,
    required String countryCode,
  }) async {
    try {
      Map<String, dynamic> response = await injector<NetworkCall>().request(
        EndPoints.update,
        params: FormData.fromMap({
          'name': name,
          'phone': phone,
          'email': email,
          'country_code': countryCode,
        }),
        options: Options(
          method: Method.post.name,
          headers: {
            "Authorization": "Bearer ${injector<HiveHelper>().getToken()}"
          },
        ),
      );
      return UpdateUserResponse.fromJson(response).data;
    } catch (error) {
      rethrow;
    }
  }
}

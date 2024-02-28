import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_test_task/core/di/injector.dart';

import '../../core/enums/enums.dart';
import '../../core/network/endpoints.dart';
import '../../core/network/network_call.dart';
import '../../models/register_response.dart';
import '../../models/user.dart';

class AuthDataSource {
  Future<UserModel?> login(
      {required String code,
        required String password,
        required String phone}) async {
    try {
      Map<String, dynamic> reponse = await injector<NetworkCall>().request(
          EndPoints.login,
          params: FormData.fromMap(
              {'code': code, 'password': password, 'phone': phone}),
          options: Options(method: Method.post.name));
      return RegisterResponse.fromJson(reponse).data;
    } catch (error) {
      rethrow;
    }
  }

  Future<UserModel?> register({
    required String name,
    required String phone,
    required String code,
    required String email,
    required String birthDate,
    required String password,
    required String passwordConfirmation,
    required String gender,
    required int countryId,
    required int cityId,
  }) async {
    try {
      Map<String, dynamic> reponse =
      await injector<NetworkCall>().request(EndPoints.register,
          params: FormData.fromMap({
            'name': name,
            'phone': phone,
            'code': code,
            'email': email,
            'password': password,
            'password_confirmation': passwordConfirmation,
            'gender': gender,
            'country_id': countryId,
            'city_id': cityId,
            'birth_date': birthDate
          }),
          options: Options(method: Method.post.name));
      return RegisterResponse.fromJson(reponse).data;
    } catch (error) {
      rethrow;
    }
  }

  Future<String> sendOtp({
    required String phone,
    required String code,
    //   required int countryId,
  }) async {
    try {
      Map<String, dynamic> reponse =
      await injector<NetworkCall>().request(EndPoints.forgotPassword,
          params: FormData.fromMap({
            'phone': phone,
            'code': code,
            //  'country_id': countryId,
          }),
          options: Options(method: Method.post.name));
      return reponse["status"].toString();
    } catch (error) {
      rethrow;
    }
  }
}
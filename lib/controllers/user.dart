// controller/user_controller.dart

import 'dart:developer';

import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../core/network/dio_helper.dart';
import '../models/user.dart';

class UserController extends GetxController {
  final DioHelper _dioHelper = DioHelper();
  final RxBool isLoading = false.obs;

  Future<void> registerUser() async {
    try {
      isLoading.toggle();
      dio.Response response = await _dioHelper.dio.post(
        'http://testapi.alifouad91.com/api/user/register',
        data: {
          // Provide necessary registration data here
        },
      );
      if (response.data['success']) {
        UserModel user = UserModel.fromJson(response.data['data']);
      } else {
        log('Registration failed: ${response.data['message']}');
      }
    } catch (error) {
      log('Error during registration: $error');
    } finally {
      isLoading.toggle();
    }
  }
}

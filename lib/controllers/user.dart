/*
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
*/
import 'package:mobile_test_task/controllers/states.dart';
import 'package:mobile_test_task/core/di/injector.dart';
import 'package:get/get.dart';
import '../core/helpers/failure_helper.dart';
import '../core/helpers/hive_helper.dart';
import '../data/repos/auth.dart';
import 'package:flutter/material.dart';
class RegisterController extends GetxController {
  final Rx<RegisterState> _state = Rx<RegisterState>(RegisterInitial());
  RegisterState get state => _state.value;

  Future<void> register({
    required String name,
    required String phone,
    required String code,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String gender,
    required int countryId,
    required int cityId,
    required String birthDate,
    required BuildContext context,
  }) async {
    _updateState(RegisterStateLoading());

    try {
      final result = await injector<AuthRepo>().register(
     /*   name: name,
        email: email,*/
        code: code,
        password: password,
        phone: phone,
       /* passwordConfirmation: passwordConfirmation,
        gender: gender,
        countryId: countryId,
        cityId: cityId,
        birthDate: birthDate,*/
      );

      result.fold(
            (l) {
          FailureHelper.instance.handleFailures(l, context);
          _updateState(RegisterStateError(l));
        },
            (r) async {
          if (r != null) {
           /* var user = FireUserChatModel(
              id: r.id,
              name: r.name,
              title: r.title,
              email: r.email,
              photoURL: r.img,
              department: r.department,
            );*/
            await injector<HiveHelper>().setToken(r.token!);
            await injector<HiveHelper>().setUserModel(r);

          /*  await FirebaseFirestore.instance
                .collection(ChatConstants.usersCollection)
                .doc(r.id.toString())
                .set(user.toJson());*/
          }

         /* Get.toNamed(Routes.success, arguments: {
            "title": AppLocalizations.of(context)?.congrats ?? "تهانينا!",
            "desc": AppLocalizations.of(context)?.congratsHint ??
                "تم إنشاء حسابك بنجاح",
            "buttonTitle":
            "اكتشف التطبيق",
            "asset": AppAssets.accountCreated,
            "isRegister": true,
            "height": 220.0,
            "width": 220.0,
          });*/
        },
      );
    } catch (e) {
      // Handle other exceptions if needed
    }
  }

  void _updateState(RegisterState newState) {
    _state.value = newState;
  }
}
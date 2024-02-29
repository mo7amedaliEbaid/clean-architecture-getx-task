import 'dart:developer';

import 'package:get/get.dart';
import '../core/core.dart';
import '../data/data.dart';
import 'package:flutter/material.dart';

class RegisterController extends GetxController {
  final RxBool isLoading = false.obs;

  Future<void> register({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String countryCode,
    required BuildContext context,
  }) async {
    isLoading.toggle();

    try {
      final result = await injector<AuthRepo>().register(
        password: password,
        phone: phone,
        email: email,
        name: name,
        passwordConfirmation: passwordConfirmation,
        countryCode: countryCode,
      );

      result.fold(
        (l) {
          FailureHelper.instance.handleFailures(l, context);
          //  Get.snackbar('Registration Error', 'Error during registration: $l');
        },
        (r) async {
          if (r != null) {
            await injector<HiveHelper>().setToken(r.token!);

            await injector<HiveHelper>().setUserModel(r);
            Get.snackbar("Successful Registration", "Congratulations",
                backgroundColor: Colors.green,
                colorText: Colors.white,
                duration: const Duration(seconds: 4));
            Get.toNamed(AppRoutes.home);

            log(r.toString());
          }
        },
      );
    } catch (e) {
      Get.snackbar('Error', 'Error during registration: $e');
    } finally {
      isLoading.toggle();
    }
  }
}

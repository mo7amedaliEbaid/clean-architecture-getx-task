import 'dart:developer';

import 'package:get/get.dart';
import '../core/core.dart';
import '../data/data.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  final RxBool isLoading = false.obs;

  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    isLoading.toggle();

    try {
      final result = await injector<LoginRepo>().login(
        password: password,
        email: email,
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
            Get.snackbar(
              "Successful Logging In",
              "Congratulations",
              backgroundColor: Colors.green,
              colorText: Colors.white,
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(seconds: 4),
            );
            Get.toNamed(AppRoutes.home);

            log(r.toString());
          }
        },
      );
    } catch (e) {
      Get.snackbar('Error', 'Error during logging in: $e');
    } finally {
      isLoading.toggle();
    }
  }
}

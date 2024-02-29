import 'dart:developer';

import 'package:get/get.dart';
import 'package:mobile_test_task/configs/app_typography.dart';
import 'package:mobile_test_task/models/models.dart';
import '../core/core.dart';
import '../data/data.dart';
import 'package:flutter/material.dart';

class UpdateUserController extends GetxController {
  final RxBool isLoading = false.obs;

  Future<void> updateUser({
    required String name,
    required String phone,
    required String email,
    required String countryCode,
    required BuildContext context,
  }) async {
    isLoading.toggle();

    try {
      final result = await injector<UpdateUserRepo>().updateUser(
        phone: phone,
        email: email,
        name: name,
        countryCode: countryCode,
      );

      result.fold(
        (l) {
          FailureHelper.instance.handleFailures(l, context);
          //  Get.snackbar('Registration Error', 'Error during registration: $l');
        },
        (r) async {
          if (r != null) {
            UserModel userModel =
                injector<HiveHelper>().getUser() ?? UserModel();

            await injector<HiveHelper>().setUserModel(
              UserModel(
                countryCode: r.countryCode,
                email: r.email,
                name: r.name,
                phone: r.phone,
                token: injector<HiveHelper>().getToken(),
                tokenExpiry: userModel.tokenExpiry,
                id: userModel.id,
              ),
            );

            Get.offAllNamed(AppRoutes.home);

            Get.snackbar(
              "Success",
              "Your information is updated successfully",
              backgroundColor: Colors.green,
              colorText: Colors.white,
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(seconds: 4),
            );

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

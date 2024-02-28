import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_test_task/core/core.dart';

import 'package:mobile_test_task/view/widgets.dart';

import '../../configs/configs.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Space.yf(4),
          logoImage(),
          Space.y1!,
          Text(
            AppStrings.welcome,
            style: AppText.h1b,
          ),
          Space.yf(12),
          customElevatedButton(
              width: AppDimensions.normalize(110),
              height: AppDimensions.normalize(20),
              color: AppColors.darkPurple,
              borderRadius: AppDimensions.normalize(4),
              text: AppStrings.login,
              textStyle: AppText.h2b!.copyWith(color: Colors.white),
              onPressed: () {}),
          Space.yf(),
          customOutlinedButton(
              width: AppDimensions.normalize(110),
              height: AppDimensions.normalize(20),
              borderColor: AppColors.darkPurple,
              borderRadius: AppDimensions.normalize(4),
              text: AppStrings.register,
              textStyle: AppText.h2b!,
              onPressed: () {
                Get.toNamed(AppRoutes.register);
              })
        ],
      ),
    );
  }
}

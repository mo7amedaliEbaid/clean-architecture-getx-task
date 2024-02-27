import 'package:flutter/material.dart';
import 'package:mobile_test_task/core/constants/assets.dart';
import 'package:mobile_test_task/core/constants/colors.dart';
import 'package:mobile_test_task/core/constants/strings.dart';

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
          Center(
            child: Image.asset(
              AppAssets.logo,
              height: AppDimensions.normalize(50),
              color: AppColors.darkPurple,
            ),
            
          ),
          Space.y1!,
          Text(AppStrings.welcome,style: AppText.h1b,),
          Space.yf(4),
        ],
      ),
    );
  }
}

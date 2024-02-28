import 'package:flutter/material.dart';

import '../../configs/configs.dart';
import '../../core/core.dart';

Widget logoImage() {
  return Center(
    child: Image.asset(
      AppAssets.logo,
      height: AppDimensions.normalize(50),
      color: AppColors.darkPurple,
    ),
  );
}

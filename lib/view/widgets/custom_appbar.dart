import 'package:flutter/material.dart';
import 'package:mobile_test_task/core/core.dart';
import 'package:mobile_test_task/configs/configs.dart';
import 'package:get/get.dart';

PreferredSizeWidget customAppBar(
    {required String title, required bool isWithBackButton}) {
  return PreferredSize(
    preferredSize: Size(
      double.infinity,
      AppDimensions.normalize(40),
    ),
    child: Container(
      color: AppColors.darkPurple,
      height: AppDimensions.normalize(42),
      child: Padding(
        padding: EdgeInsets.only(
          left: AppDimensions.normalize(7),
          right: AppDimensions.normalize(7),
          bottom: AppDimensions.normalize(7),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isWithBackButton
                ? GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: AppDimensions.normalize(12),
                      color: Colors.white,
                    ),
                  )
                : const SizedBox.shrink(),
            Text(
              title,
              style: AppText.h2b?.copyWith(
                color: Colors.white,
              ),
            ),
            const SizedBox.shrink()
          ],
        ),
      ),
    ),
  );
}

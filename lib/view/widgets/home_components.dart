import 'package:flutter/material.dart';
import 'package:mobile_test_task/configs/configs.dart';
import 'package:mobile_test_task/core/core.dart';

Widget userInfoRow({
  required String text,
  required IconData iconData,
}) {
  return Row(
    children: [
      Space.x1!,
      Icon(
        iconData,
        color: AppColors.darkPurple,
        size: AppDimensions.normalize(12),
      ),
      Space.xf(1.5),
      Text(
        text,
        style: AppText.h3b?.copyWith(
          color: Colors.grey,
        ),
      )
    ],
  );
}

Widget functionalitiesRow({
  required String text,
  required BuildContext context,
  void Function()? onTap
}) {
  return Material(
    borderRadius: BorderRadius.circular(
      AppDimensions.normalize(3),
    ),
    elevation: 2,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          AppDimensions.normalize(3),
        ),
      ),
      height: AppDimensions.normalize(25),
      width: MediaQuery.sizeOf(context).width - AppDimensions.normalize(5),
      padding: Space.h1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: AppText.h2b,
          ),
          GestureDetector(
            onTap: onTap,
            child: Icon(
              Icons.arrow_forward_ios,
              size: AppDimensions.normalize(13),
              color: AppColors.darkPurple,
            ),
          )
        ],
      ),
    ),
  );
}

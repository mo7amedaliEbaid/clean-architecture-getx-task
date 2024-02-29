import 'package:flutter/material.dart';
import 'package:mobile_test_task/core/constants/colors.dart';

Widget customUnderLinedText(
  TextStyle? style,
  String text,
) {
  return Text(
    text,
    style: style?.copyWith(
      shadows: [
        Shadow(color: AppColors.darkPurple, offset: const Offset(0, -1))
      ],
      color: Colors.transparent,
      decorationColor: AppColors.darkPurple,
      letterSpacing: .5,
      decoration: TextDecoration.underline,
      decorationThickness: 3.5,
    ),
  );
}

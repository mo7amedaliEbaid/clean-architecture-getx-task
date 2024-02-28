import 'package:flutter/material.dart';
import 'package:mobile_test_task/configs/configs.dart';

Widget customTextField(
    {required String labelText,
    Widget? prefix,
    bool? obscureText,
    String? Function(String?)? validator,
    void Function(String)? onChanged,
    required TextEditingController controller}) {
  return TextFormField(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    validator: validator,
    controller: controller,
    onChanged: onChanged,
    obscureText: obscureText ?? false,
    style: AppText.b2b,
    decoration: InputDecoration(
      errorMaxLines: 3,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.grey,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(
          AppDimensions.normalize(4),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(
          AppDimensions.normalize(4),
        ),
      ),
      contentPadding: Space.all(1, 1),
      border: const OutlineInputBorder(),
      label: Center(
        child: Text(
          labelText,
          style: AppText.h3b?.copyWith(
            color: Colors.grey,
          ),
        ),
      ),
      alignLabelWithHint: true,
      prefixIcon: prefix,
      errorStyle: AppText.b2b!.copyWith(
        color: Colors.red,
      ),

    ),
  );
}

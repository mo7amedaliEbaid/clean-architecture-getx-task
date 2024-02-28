// view/register_page.dart

import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:mobile_test_task/core/core.dart';

import 'package:mobile_test_task/view/widgets.dart';
import 'package:mobile_test_task/view/widgets/custom_texyfield.dart';

import '../../configs/configs.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  CountryCode selectedCountry = CountryCode.fromCountryCode('EG');

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isValid = true;
  bool _isConfirmPasswordObscure = true;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: Space.hf(2.5),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Space.yf(4),
                logoImage(),
                Space.y1!,
                Text(
                  AppStrings.register,
                  style: AppText.h1b,
                ),
                Space.yf(3),
                customTextField(
                    labelText: AppStrings.fullName,
                    controller: _fullNameController,
                    validator: injector<Validators>().validateFullName),
                Space.yf(),
                customTextField(
                  prefix: CountryCodePicker(
                    onChanged: (code) {
                      setState(() {
                        selectedCountry = code;
                        log(selectedCountry.toString());
                        log(selectedCountry.code.toString());
                      });
                    },
                    initialSelection: 'EG',
                    favorite: const ['+20', 'EG'],
                    padding: EdgeInsets.zero,
                    showCountryOnly: false,
                    showFlag: true,
                    textStyle: AppText.h3b?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  labelText: AppStrings.phoneNumber,
                  controller: _phoneController,
                  validator: injector<Validators>().validateNumbers,
                ),
                Space.yf(),
                customTextField(
                    labelText: AppStrings.emailAddress,
                    controller: _emailController,
                    validator: injector<Validators>().validateEmail),
                Space.yf(),
                customTextField(
                    labelText: AppStrings.password,
                    controller: _phoneController,
                    validator: injector<Validators>().validatePassword),
                Space.yf(),
                Stack(
                  children: [
                    customTextField(
                      labelText: AppStrings.confirmPassword,
                      obscureText: _isConfirmPasswordObscure,
                      controller: _confirmPasswordController,
                      validator: (value) =>
                          injector<Validators>().validateConfirmPassword(
                        _passwordController.text,
                        value,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      top: 0,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            _isConfirmPasswordObscure =
                                !_isConfirmPasswordObscure;
                          });
                        },
                        icon: Icon(
                          Icons.remove_red_eye,
                          size: AppDimensions.normalize(11),
                          color: Colors.grey,
                        ),
                      ),
                    )
                  ],
                ),
                Space.yf(2),
                customElevatedButton(
                    width: double.infinity,
                    height: AppDimensions.normalize(20),
                    color: AppColors.darkPurple,
                    borderRadius: AppDimensions.normalize(4),
                    text: AppStrings.register,
                    textStyle: AppText.h2b!.copyWith(color: Colors.white),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

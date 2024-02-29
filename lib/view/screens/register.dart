import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:mobile_test_task/controllers/controllers.dart';
import 'package:mobile_test_task/core/core.dart';
import 'package:get/get.dart';
import 'package:mobile_test_task/view/widgets.dart';

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
  bool _isPasswordObscure = true;

  @override
  void initState() {
    super.initState();
  }

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
    App.init(context);
    RegisterController registerController = Get.find<RegisterController>();

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
                    controller: _passwordController,
                    suffix: IconButton(
                      onPressed: () {
                        setState(() {
                          _isPasswordObscure = !_isPasswordObscure;
                        });
                      },
                      icon: Icon(
                        _isPasswordObscure
                            ? Icons.visibility
                            : Icons.visibility_off,
                        size: AppDimensions.normalize(11),
                        color: Colors.grey,
                      ),
                    ),
                    validator: injector<Validators>().validatePassword),
                Space.yf(),
                customTextField(
                  labelText: AppStrings.confirmPassword,
                  obscureText: _isConfirmPasswordObscure,
                  suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        _isConfirmPasswordObscure = !_isConfirmPasswordObscure;
                      });
                    },
                    icon: Icon(
                      _isConfirmPasswordObscure
                          ? Icons.visibility
                          : Icons.visibility_off,
                      size: AppDimensions.normalize(11),
                      color: Colors.grey,
                    ),
                  ),
                  controller: _confirmPasswordController,
                  validator: (value) =>
                      injector<Validators>().validateConfirmPassword(
                    _passwordController.text,
                    value,
                  ),
                ),
                Space.yf(2),
                customElevatedButton(
                    width: double.infinity,
                    height: AppDimensions.normalize(20),
                    color: AppColors.darkPurple,
                    borderRadius: AppDimensions.normalize(4),
                    text: AppStrings.register,
                    textStyle: AppText.h2b!.copyWith(color: Colors.white),
                    onPressed: () async{

                      if (_formKey.currentState!.validate()) {
                       await registerController.register(
                          name: _fullNameController.text,
                          phone: _phoneController.text,
                          countryCode: selectedCountry.code ?? "+2",
                          email: _emailController.text,
                          password: _passwordController.text,
                          context: context,
                          passwordConfirmation: _confirmPasswordController.text,
                        );
                      }

                    }),
                Space.yf(2.5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.alreadyHaveAccount,
                      style: AppText.h3,
                    ),
                    TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () {},
                        child: Text(
                          AppStrings.login,
                          style: AppText.h3b,
                        ))
                  ],
                ),
                Space.yf(.5)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

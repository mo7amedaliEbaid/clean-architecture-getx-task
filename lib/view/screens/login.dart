import 'package:flutter/material.dart';
import 'package:mobile_test_task/configs/configs.dart';
import 'package:mobile_test_task/controllers/controllers.dart';
import 'package:mobile_test_task/core/core.dart';
import 'package:get/get.dart';
import 'package:mobile_test_task/view/widgets.dart';
//rrr@gmail.com
//Aa@123456
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _isPasswordObscure = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);
    LoginController loginController = Get.find<LoginController>();
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
                  AppStrings.login,
                  style: AppText.h1b,
                ),
                Space.yf(5),
                customTextField(
                  labelText: AppStrings.emailAddress,
                  controller: _emailController,
                  validator: (value) =>
                      injector<Validators>().validateNullOrEmpty(
                    _emailController.text,
                    AppStrings.emailAddress,
                  ),
                ),
                Space.yf(1.5),
                customTextField(
                  labelText: AppStrings.password,
                  controller: _passwordController,
                  obscureText: _isPasswordObscure,
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
                  validator: (value) =>
                      injector<Validators>().validateNullOrEmpty(
                    _passwordController.text,
                    AppStrings.password,
                  ),
                ),
                Space.yf(2.78),
                loginController.isLoading.isTrue
                    ? CircularProgressIndicator(
                        color: AppColors.darkPurple,
                      )
                    : customElevatedButton(
                        width: double.infinity,
                        height: AppDimensions.normalize(20),
                        color: AppColors.darkPurple,
                        borderRadius: AppDimensions.normalize(4),
                        text: AppStrings.login,
                        textStyle: AppText.h2b!.copyWith(color: Colors.white),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await loginController.login(
                              email: _emailController.text,
                              password: _passwordController.text,
                              context: context,
                            );
                          }
                        }),
                Space.yf(6.5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.donNotHaveAccount,
                      style: AppText.h3,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(padding: Space.hf(.3)),
                      onPressed: () {
                        Get.toNamed(AppRoutes.register);
                      },
                      child: Text(
                        AppStrings.register,
                        style: AppText.h3b,
                      ),
                    )
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

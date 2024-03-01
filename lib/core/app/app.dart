import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_test_task/bindings/bindings.dart';
import 'package:mobile_test_task/core/core.dart';

import '../../view/screens.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    log("Token = ${injector<HiveHelper>().getToken()}");
    return GetMaterialApp(
      title: 'task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: AppStrings.fontFamily),
      home: const WelcomeScreen(),
      getPages: [
        GetPage(
          name: AppRoutes.register,
          page: () => const RegisterScreen(),
          binding: RegisterBinding(),
        ),
        GetPage(
          name: AppRoutes.home,
          page: () => const HomeScreen(),
        ),
        GetPage(
          name: AppRoutes.login,
          page: () => const LoginScreen(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: AppRoutes.changePassword,
          page: () => const UpdateUserScreen(),
          binding: UpdateUserBinding(),
        ),
      ],
    );
  }
}

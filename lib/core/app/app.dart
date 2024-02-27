import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_test_task/core/constants/strings.dart';

import '../../controllers/user.dart';
import '../../view/screens/register.dart';
import '../../view/screens/welcome.dart';

class MyApp extends StatelessWidget {
  final UserController _userController = UserController();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: AppStrings.fontFamily),
      home: const WelcomeScreen(),
      getPages: [
        GetPage(
          name: '/register',
          page: () => RegisterPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut<UserController>(() => _userController);
          }),
        ),
      ],
    );
  }
}

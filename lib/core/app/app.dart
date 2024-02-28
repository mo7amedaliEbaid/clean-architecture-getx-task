import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_test_task/core/core.dart';


import '../../view/screens.dart';

class MyApp extends StatelessWidget {
  //final UserController _userController = UserController();

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
          name: AppRoutes.register,
          page: () => const RegisterScreen(),
          /*binding: BindingsBuilder(() {
            Get.lazyPut<UserController>(() => _userController);*/
         // }
        //  ),
        ),
      ],
    );
  }
}

// view/register_page.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/user.dart';

class RegisterPage extends StatelessWidget {
  final UserController _userController = Get.put(UserController());

   RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Center(
        child: Obx(
              () => _userController.isLoading.value
              ? const CircularProgressIndicator()
              : ElevatedButton(
            onPressed: () => _userController.registerUser(),
            child: const Text('Register'),
          ),
        ),
      ),
    );
  }
}

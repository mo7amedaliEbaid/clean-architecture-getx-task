import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:mobile_test_task/configs/configs.dart';
import 'package:mobile_test_task/controllers/controllers.dart';
import 'package:mobile_test_task/core/core.dart';
import 'package:get/get.dart';
import 'package:mobile_test_task/view/widgets.dart';

import '../../models/models.dart';

class UpdateUserScreen extends StatefulWidget {
  const UpdateUserScreen({super.key});

  @override
  State<UpdateUserScreen> createState() => _UpdateUserScreenState();
}

class _UpdateUserScreenState extends State<UpdateUserScreen> {
  late UserModel userModel;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    userModel = injector<HiveHelper>().getUser() ?? UserModel();
    super.initState();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    UpdateUserController updateUserController =
        Get.find<UpdateUserController>();

    CountryCode userCountry =
        CountryCode.fromDialCode(userModel.countryCode ?? "+20");
    _phoneController.text = userModel.phone ?? "";
    _fullNameController.text = userModel.name ?? "";
    _emailController.text = userModel.email ?? "";

    return Scaffold(
      appBar: customAppBar(
        title: AppStrings.updateInfo,
        isWithBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: Space.hf(2.5),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Space.yf(1.5),
                customTextField(
                    labelText: AppStrings.fullName,
                    controller: _fullNameController,
                    validator: injector<Validators>().validateFullName),
                Space.yf(1.2),
                customTextField(
                  prefix: CountryCodePicker(
                    onChanged: (code) {
                      setState(() {
                        userCountry = code;
                        log(userCountry.toString());
                        log(userCountry.code.toString());
                      });
                    },
                    initialSelection: userCountry.code,
                    favorite: [
                      userCountry.dialCode ?? "",
                      userCountry.code ?? ""
                    ],
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
                Space.yf(1.2),
                customTextField(
                    labelText: AppStrings.emailAddress,
                    controller: _emailController,
                    validator: injector<Validators>().validateEmail),
                Space.yf(1.2),
                customElevatedButton(
                    width: double.infinity,
                    height: AppDimensions.normalize(20),
                    color: AppColors.darkPurple,
                    borderRadius: AppDimensions.normalize(4),
                    text: AppStrings.save,
                    textStyle: AppText.h2b!.copyWith(color: Colors.white),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await updateUserController.updateUser(
                          name: _fullNameController.text,
                          phone: _phoneController.text,
                          countryCode: userCountry.dialCode ?? "",
                          email: _emailController.text,
                          context: context,
                        );
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

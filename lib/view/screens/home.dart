import 'dart:developer';

//import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

//import 'package:flag/flag_enum.dart';
//import 'package:flag/flag_widget.dart';
import 'package:mobile_test_task/configs/configs.dart';
import 'package:mobile_test_task/core/core.dart';
import 'package:mobile_test_task/models/models.dart';
import 'package:mobile_test_task/view/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late UserModel userModel;

  @override
  void initState() {
    userModel = injector<HiveHelper>().getUser() ?? UserModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);
    log(userModel.countryCode.toString());
    Future<bool> _onWillPop() async {
      return (await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(
                "Exit Application",
                style: TextStyle(color: AppColors.darkPurple),
              ),
              content: const Text(
                "Are You Sure?",
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text(
                    "Yes",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                ),
                TextButton(
                  child: Text(
                    "No",
                    style: TextStyle(color: AppColors.darkPurple),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          )) ??
          false;
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: customAppBar(
          title: AppStrings.home,
          isWithBackButton: false,
        ),
        body: Column(
          children: [
            Space.yf(1.5),
            userInfoRow(
              text: userModel.name ?? "",
              iconData: Icons.person_outline_outlined,
            ),
            Space.yf(),
            userInfoRow(
              text: "${userModel.countryCode} ${userModel.phone}",
              iconData: Icons.phone_android,
            ),
            Space.yf(),
            userInfoRow(
              text: userModel.email ?? "",
              iconData: Icons.email_outlined,
            ),
            Space.yf(1.5),
            functionalitiesRow(
                text: AppStrings.updateInfo,
                context: context,
                onTap: () {
                  Get.toNamed(AppRoutes.changePassword);
                }),
            Space.yf(.3),
            functionalitiesRow(
                text: AppStrings.changePassword, context: context),
            Space.yf(.3),
            functionalitiesRow(
                text: AppStrings.deleteAccount, context: context),
            Space.yf(.3),
            functionalitiesRow(text: AppStrings.logOut, context: context),
          ],
        ),
      ),
    );
  }
}

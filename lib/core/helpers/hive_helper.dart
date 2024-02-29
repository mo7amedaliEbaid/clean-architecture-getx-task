import 'package:hive_flutter/hive_flutter.dart';

import '../../models/user.dart';
class HiveHelper {
  final String _name = 'doctor';

  Future initHiveBoxes() async {
    await Hive.initFlutter();
    await Future.forEach(_HiveKeys.values, (_HiveKeys element) async {
      await Hive.openBox(element.name + _name);
    });
  }

  bool getModeState() {
    return Hive.box(_HiveKeys.darkModeKey.name + _name).isNotEmpty
        ? Hive.box(_HiveKeys.darkModeKey.name + _name)
        .get(_HiveKeys.darkModeKey.name + _name)
        : false;
  }

  void setModeState({required bool isDark}) {
    Hive.box(_HiveKeys.darkModeKey.name + _name)
        .put(_HiveKeys.darkModeKey.name + _name, isDark);
  }

  String getLang() {
    return Hive.box(_HiveKeys.langKey.name + _name).isNotEmpty
        ? Hive.box(_HiveKeys.langKey.name + _name)
        .get(_HiveKeys.langKey.name + _name)
        : 'ar';
  }

  void setLang({required String langCode}) {
    Hive.box(_HiveKeys.langKey.name + _name)
        .put(_HiveKeys.langKey.name + _name, langCode);
  }

  Future<void> setIsFirst(bool isFirst) async {
    await Hive.box(_HiveKeys.isFirst.name + _name)
        .put(_HiveKeys.isFirst.name + _name, isFirst);
  }

  bool getIsFirst() {
    return Hive.box(_HiveKeys.isFirst.name + _name).isNotEmpty
        ? Hive.box(_HiveKeys.isFirst.name + _name)
        .get(_HiveKeys.isFirst.name + _name)
        : true;
  }

 /* Future<void> logout(BuildContext context) async {
    await Hive.box(_HiveKeys.user.name + _name).clear();
    await Hive.box(_HiveKeys.token.name + _name).clear();
    Navigator.of(context)
        .pushNamedAndRemoveUntil(Routes.login, (Route<dynamic> route) => false);
  }*/

  Future<void> setToken(String token) async {
    await Hive.box(_HiveKeys.token.name + _name)
        .put(_HiveKeys.token.name + _name, token);
  }

  String? getToken() {
    return Hive.box(_HiveKeys.token.name + _name).isNotEmpty
        ? Hive.box(_HiveKeys.token.name + _name)
        .get(_HiveKeys.token.name + _name)
        : null;
  }

 /* UserModel? getUser() {
    return Hive.box(_HiveKeys.user.name + _name).isNotEmpty
        ? userModelFromJson(Hive.box(_HiveKeys.user.name + _name)
        .get(_HiveKeys.user.name + _name))
        : null;
  }*/

  Future<void> setUserModel(UserModel userModel) async {
    await Hive.box(_HiveKeys.user.name + _name)
        .put(_HiveKeys.user.name + _name, userModelToJson(userModel));
  }
}

enum _HiveKeys { darkModeKey, langKey, isFirst, token, user }
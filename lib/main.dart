// main.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/core.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initSingletons();
  await Hive.initFlutter();
  await injector<HiveHelper>().initHiveBoxes();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

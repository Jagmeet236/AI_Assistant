import 'package:arti_genius/helper/helper.dart';
import 'package:arti_genius/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

//init hive
  Pref.initialize();

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: appName,
      themeMode: Pref.defaultTheme,

      //dark theme
      darkTheme: darkTheme,

      //light theme
      theme: lightTheme,

      debugShowCheckedModeBanner: false,

      home: const SplashScreen(),
    );
  }
}

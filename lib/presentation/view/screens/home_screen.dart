import 'package:arti_genius/helper/helper.dart';
import 'package:arti_genius/models/home_type.dart';
import 'package:arti_genius/presentation/presentation.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _isDarkMode = Pref.isDarkMode.obs;
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    Pref.showOnboarding = false;
  }

  @override
  Widget build(BuildContext context) {
    //initializing device size
    mq = MediaQuery.sizeOf(context);

    return Scaffold(
        //app bar
        appBar: AppBar(
          title: const Text(
            appName,
          ),
          actions: [
            IconButton(
                padding: const EdgeInsets.only(right: 10),
                onPressed: () {
                  Get.changeThemeMode(
                      _isDarkMode.value ? ThemeMode.light : ThemeMode.dark);

                  _isDarkMode.value = !_isDarkMode.value;
                  Pref.isDarkMode = _isDarkMode.value;
                },
                icon: Obx(() => Icon(
                    _isDarkMode.value
                        ? Icons.brightness_3_rounded
                        : Icons.brightness_4_rounded,
                    size: 26)))
          ],
        ),
        //body
        body: ListView(
          padding: EdgeInsets.symmetric(
              horizontal: mq.width * .04, vertical: mq.height * .015),
          children: HomeType.values
              .map((e) => HomeCard(
                    homeType: e,
                  ))
              .toList(),
        ));
  }
}

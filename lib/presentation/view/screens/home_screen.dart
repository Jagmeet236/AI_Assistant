import 'package:arti_genius/helper/helper.dart';
import 'package:arti_genius/models/home_type.dart';
import 'package:arti_genius/presentation/presentation.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    Pref.showOnboarding = false;
  }

  @override
  Widget build(BuildContext context) {
    // initializing text theme
    final textTheme = Theme.of(context).textTheme;

    //initializing device size
    mq = MediaQuery.sizeOf(context);

    return Scaffold(
        //app bar
        appBar: AppBar(
          title: Text(
            appName,
            style: textTheme.titleLarge?.copyWith(
                color: blueColor,
                letterSpacing: 0.1,
                fontFamily: GoogleFonts.robotoMono().fontFamily),
          ),
          actions: const [
            Icon(
              Icons.brightness_4_sharp,
              color: blueColor,
            ),
            sizedBoxR
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

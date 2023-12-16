import 'package:arti_genius/helper/global_constant.dart';
import 'package:arti_genius/helper/pref.dart';
import 'package:arti_genius/presentation/presentation.dart';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() =>
          Pref.showOnboarding ? const OnBoardingScreen() : const HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    //initializing device size
    mq = MediaQuery.sizeOf(context);

//initializing text theme
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            const Spacer(
              flex: 2,
            ),
            Card(
              elevation: 1,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(mq.width * .05),
                child: Column(
                  children: <Widget>[
                    //App Image for the assets/image
                    Image.asset(
                      'assets/images/app_logo.png',
                      width: mq.width * .4,
                    ),
                    sizedBoxC,

                    //text appName
                    Text(
                      appName,
                      style: textTheme.headlineSmall?.copyWith(
                          fontFamily: GoogleFonts.robotoMono().fontFamily,
                          letterSpacing: 0.5),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),

            //custom loading animation
            const CustomLoading(),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}

import 'package:arti_genius/helper/global_constant.dart';
import 'package:arti_genius/helper/helper.dart';
import 'package:arti_genius/presentation/presentation.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:get/route_manager.dart';
import 'package:arti_genius/models/models.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();

    //initializing text theme
    final textTheme = Theme.of(context).textTheme;
    //initializing device size
    mq = MediaQuery.sizeOf(context);

    final list = [
      //onboarding 1
      OnBoard(
          title: 'Ask me Anything',
          subtitle:
              'I can be your Best Friend & You can ask me anything & I will help you!',
          lottie: 'ai_ask_me'),

      //onboarding 2
      OnBoard(
        title: 'Imagination to Reality',
        lottie: 'ai_play',
        subtitle:
            'Just Imagine anything & let me know, I will create something wonderful for you!',
      ),
    ];

    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: list.length,
        itemBuilder: (ctx, ind) {
          final isLast = ind == list.length - 1;

          return Column(
            children: [
              //lottie
              Lottie.asset('assets/lottie/${list[ind].lottie}.json',
                  height: mq.height * .6, width: isLast ? mq.width * .7 : null),

              //title
              Text(
                list[ind].title,
                style: textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    letterSpacing: .5,
                    fontFamily: GoogleFonts.robotoMono().fontFamily),
              ),

              //for adding some space
              sizedBoxC,

              //subtitle
              SizedBox(
                width: mq.width * .7,
                child: Text(
                  list[ind].subtitle,
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium?.copyWith(
                      letterSpacing: .5,
                      color: Theme.of(context).lightTextColor,
                      fontFamily: GoogleFonts.robotoMono().fontFamily),
                ),
              ),

              const Spacer(),

              //dots

              Wrap(
                spacing: 10,
                children: List.generate(
                    list.length,
                    (i) => Container(
                          width: i == ind ? 15 : 10,
                          height: 8,
                          decoration: BoxDecoration(
                              color: i == ind ? Colors.blue : Colors.grey,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5))),
                        )),
              ),

              const Spacer(),

              //button
              CustomButton(
                  onTap: () {
                    if (isLast) {
                      Get.off(() => const HomeScreen());
                    } else {
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.ease);
                    }
                  },
                  text: isLast ? 'Finish' : 'Next'),

              const Spacer(flex: 2),
            ],
          );
        },
      ),
    );
  }
}

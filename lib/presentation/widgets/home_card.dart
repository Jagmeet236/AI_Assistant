import 'package:arti_genius/helper/global_constant.dart';
import 'package:arti_genius/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:arti_genius/models/models.dart';

class HomeCard extends StatelessWidget {
  final HomeType homeType;
  const HomeCard({
    Key? key,
    required this.homeType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // initializing text theme
    final textTheme = Theme.of(context).textTheme;

    Animate.restartOnHotReload = true;
    return Card(
        color: Colors.blue.withOpacity(.2),
        elevation: 0,
        margin: EdgeInsets.only(bottom: mq.height * .02),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: InkWell(
          onTap: homeType.onTap,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          child: homeType.leftAlign
              ? Row(
                  children: [
                    //lottie
                    Container(
                      width: mq.width * .35,
                      padding: homeType.padding,
                      child: Lottie.asset('assets/lottie/${homeType.lottie}'),
                    ),

                    const Spacer(),

                    //title
                    Text(
                      homeType.title,
                      style: textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).lightTextColor,
                          fontFamily: GoogleFonts.robotoMono().fontFamily,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.5),
                    ),

                    const Spacer(flex: 2),
                  ],
                )
              : Row(
                  children: [
                    const Spacer(flex: 2),

                    //title
                    Text(
                      homeType.title,
                      style: textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).lightTextColor,
                          fontFamily: GoogleFonts.robotoMono().fontFamily,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.5),
                    ),

                    const Spacer(),

                    //lottie
                    Container(
                      width: mq.width * .35,
                      padding: homeType.padding,
                      child: Lottie.asset('assets/lottie/${homeType.lottie}'),
                    ),
                  ],
                ),
        )).animate().fade(duration: 1.seconds, curve: Curves.easeIn);
  }
}

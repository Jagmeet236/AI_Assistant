import 'package:arti_genius/helper/global_constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const CustomButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    // initializing text theme
    final textTheme = Theme.of(context).textTheme;
    return Align(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            backgroundColor: blueColor,
            foregroundColor: whiteColor,
            elevation: 0,
            textStyle: textTheme.titleLarge?.copyWith(
                fontFamily: GoogleFonts.robotoMono().fontFamily,
                letterSpacing: 0.2),
            minimumSize: Size(mq.width * .4, 50)),
        onPressed: onTap,
        child: Text(text),
      ),
    );
  }
}

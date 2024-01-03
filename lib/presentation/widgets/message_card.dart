import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:arti_genius/models/message.dart';
import 'package:arti_genius/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageCard extends StatelessWidget {
  final Message message;

  const MessageCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    //initializing text theme
    final textTheme = Theme.of(context).textTheme;

    const r = Radius.circular(15);

    return message.msgType == MessageType.bot

        //bot
        ? Row(children: [
            const SizedBox(width: 6),

            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.white,
              child: Image.asset('assets/images/app_logo.png', width: 24),
            ),

            //
            Container(
              constraints: BoxConstraints(maxWidth: mq.width * .6),
              margin: EdgeInsets.only(
                  bottom: mq.height * .02, left: mq.width * .02),
              padding: EdgeInsets.symmetric(
                  vertical: mq.height * .01, horizontal: mq.width * .02),
              decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).lightTextColor),
                  borderRadius: const BorderRadius.only(
                      topLeft: r, topRight: r, bottomRight: r)),
              child: message.msg.isEmpty
                  ? AnimatedTextKit(animatedTexts: [
                      TypewriterAnimatedText(
                        ' Please wait... ',
                        speed: const Duration(milliseconds: 100),
                      ),
                    ], repeatForever: true)
                  : Text(
                      message.msg,
                      textAlign: TextAlign.center,
                      style: textTheme.bodyMedium?.copyWith(
                          fontFamily: GoogleFonts.robotoMono().fontFamily,
                          letterSpacing: 0.2),
                    ),
            )
          ])

        //user
        : Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            //
            Container(
                constraints: BoxConstraints(maxWidth: mq.width * .6),
                margin: EdgeInsets.only(
                    bottom: mq.height * .02, right: mq.width * .02),
                padding: EdgeInsets.symmetric(
                    vertical: mq.height * .01, horizontal: mq.width * .02),
                decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).lightTextColor),
                    borderRadius: const BorderRadius.only(
                        topLeft: r, topRight: r, bottomLeft: r)),
                child: Text(
                  message.msg,
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium?.copyWith(
                      fontFamily: GoogleFonts.robotoMono().fontFamily,
                      letterSpacing: 0.2),
                )),

            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Theme.of(context).buttonColor),
            ),

            const SizedBox(width: 6),
          ]);
  }
}

import 'package:arti_genius/controllers/chatbot_controller.dart';
import 'package:arti_genius/helper/helper.dart';
import 'package:arti_genius/presentation/widgets/message_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatBotFeature extends StatefulWidget {
  const ChatBotFeature({super.key});

  @override
  State<ChatBotFeature> createState() => _ChatBotFeatureState();
}

class _ChatBotFeatureState extends State<ChatBotFeature> {
  final _controller = ChatController();

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
          'Chat with AI Assistant',
          style: textTheme.titleMedium?.copyWith(
              color: blueColor,
              letterSpacing: 0.1,
              fontFamily: GoogleFonts.robotoMono().fontFamily),
        ),
      ),

      //send message field & btn
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(children: [
          //for adding some space
          sizedBoxR,
          //text input field
          Expanded(
              child: TextFormField(
            controller: _controller.textC,
            textAlign: TextAlign.center,
            onTapOutside: (e) => FocusScope.of(context).unfocus(),
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              isDense: true,
              hintText: 'Ask me anything you want...',
              hintStyle: textTheme.bodyLarge?.copyWith(
                  fontFamily: GoogleFonts.robotoMono().fontFamily,
                  color: blackColorLight),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
            ),
          )),

          //for adding some space
          sizedBoxR,

          //send button
          CircleAvatar(
            backgroundColor: blueColor,
            radius: 24,
            child: IconButton(
              onPressed: _controller.askQuestion,
              icon: const Icon(Icons.rocket_launch_rounded,
                  color: Colors.white, size: 28),
            ),
          )
        ]),
      ),

      //body
      body: Obx(
        () => ListView(
          physics: const BouncingScrollPhysics(),
          controller: _controller.scrollC,
          padding:
              EdgeInsets.only(top: mq.height * .02, bottom: mq.height * .1),
          children:
              _controller.list.map((e) => MessageCard(message: e)).toList(),
        ),
      ),
    );
  }
}

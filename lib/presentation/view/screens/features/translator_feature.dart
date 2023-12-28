import 'package:arti_genius/controllers/translate_controller.dart';
import 'package:arti_genius/helper/global_constant.dart';
import 'package:arti_genius/presentation/presentation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TranslatorFeature extends StatefulWidget {
  const TranslatorFeature({super.key});

  @override
  State<TranslatorFeature> createState() => _TranslatorFeatureState();
}

class _TranslatorFeatureState extends State<TranslatorFeature> {
  final _controller = TranslateController();
  @override
  Widget build(BuildContext context) {
    // initializing text theme
    final textTheme = Theme.of(context).textTheme;

    //initializing device size
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Multi Language Translator',
          style: textTheme.titleMedium?.copyWith(
              color: blueColor,
              letterSpacing: 0.1,
              fontFamily: GoogleFonts.robotoMono().fontFamily,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          top: mq.height * .02,
          bottom: mq.height * .1,
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //from language
              InkWell(
                onTap: () => Get.bottomSheet(LanguageSheet(
                  langC: _controller,
                  str: _controller.from,
                )),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: mq.width * 0.4,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: blueColor,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Obx(
                    () => Text(
                      _controller.from.isEmpty
                          ? 'Auto'
                          : _controller.from.value,
                      style: textTheme.bodyMedium?.copyWith(
                        color: blackColor,
                        letterSpacing: 0.1,
                        fontFamily: GoogleFonts.robotoMono().fontFamily,
                      ),
                    ),
                  ),
                ),
              ),

              //swap button
              //swipe language btn
              IconButton(
                  onPressed: _controller.swapLanguages,
                  icon: Obx(
                    () => Icon(
                      CupertinoIcons.repeat,
                      color: _controller.to.isNotEmpty &&
                              _controller.from.isNotEmpty
                          ? blueColor
                          : greyColor,
                    ),
                  )),
              //to language
              InkWell(
                onTap: () => Get.bottomSheet(LanguageSheet(
                  langC: _controller,
                  str: _controller.to,
                )),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: mq.width * 0.4,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: blueColor,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Obx(
                    () => Text(
                      _controller.to.isEmpty ? 'To' : _controller.to.value,
                      style: textTheme.bodyMedium?.copyWith(
                        color: blackColor,
                        letterSpacing: 0.1,
                        fontFamily: GoogleFonts.robotoMono().fontFamily,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          //textfield
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: mq.width * .04, vertical: mq.height * .04),
            child: TextFormField(
              controller: _controller.textC,
              minLines: 5,
              maxLines: null,
              onTapOutside: (e) => FocusScope.of(context).unfocus(),
              decoration: InputDecoration(
                hintText: 'Translate anything you want...',
                hintStyle: textTheme.bodyMedium?.copyWith(
                    fontFamily: GoogleFonts.robotoMono().fontFamily,
                    color: blackColorLight),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
          ),

          //resultField

          Obx(() => _translateResult()),

          //adding some space
          SizedBox(
            height: mq.height * .04,
          ),

          //translate button
          CustomButton(onTap: _controller.translate, text: 'Translate')
        ],
      ),
    );
  }

  Widget _translateResult() => switch (_controller.status.value) {
        Status.none => const SizedBox(),
        Status.complete => Padding(
            padding: EdgeInsets.symmetric(
              horizontal: mq.width * .04,
            ),
            child: TextFormField(
              controller: _controller.resultC,
              maxLines: null,
              onTapOutside: (e) => FocusScope.of(context).unfocus(),
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        Status.loading => const Align(child: CustomLoading())
      };
}

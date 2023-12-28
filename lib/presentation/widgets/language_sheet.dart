import 'dart:developer';

import 'package:arti_genius/controllers/translate_controller.dart';
import 'package:arti_genius/helper/global_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LanguageSheet extends StatefulWidget {
  final TranslateController langC;
  final RxString str;

  const LanguageSheet({super.key, required this.langC, required this.str});

  @override
  State<LanguageSheet> createState() => _LanguageSheetState();
}

class _LanguageSheetState extends State<LanguageSheet> {
  final _search = ''.obs;

  @override
  Widget build(BuildContext context) {
    //initializing device size
    mq = MediaQuery.sizeOf(context);

    // initializing text theme
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: mq.height * .5,
      padding: EdgeInsets.only(
          left: mq.width * .04, right: mq.width * .04, top: mq.height * .02),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Column(
        children: [
          TextFormField(
            // controller: _c.resultC,
            onChanged: (s) => _search.value = s.toLowerCase(),

            onTapOutside: (e) => FocusScope.of(context).unfocus(),
            decoration: InputDecoration(
                prefixIcon:
                    const Icon(Icons.translate_rounded, color: Colors.blue),
                hintText: 'Search Language...',
                hintStyle: textTheme.bodyMedium?.copyWith(
                    fontFamily: GoogleFonts.robotoMono().fontFamily,
                    color: blackColorLight),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
          ),

          //
          Expanded(
            child: Obx(
              () {
                final List<String> list = _search.isEmpty
                    ? widget.langC.lang
                    : widget.langC.lang
                        .where((e) => e.toLowerCase().contains(_search.value))
                        .toList();

                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: list.length,
                  padding: EdgeInsets.only(top: mq.height * .02, left: 6),
                  itemBuilder: (ctx, i) {
                    return InkWell(
                      onTap: () {
                        widget.str.value = list[i];
                        log(list[i]);
                        Get.back();
                      },
                      child: Padding(
                        padding: EdgeInsets.only(bottom: mq.height * .02),
                        child: Text(list[i]),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

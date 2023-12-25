import 'package:arti_genius/helper/my_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslateController extends GetxController {
  final textC = TextEditingController();
  final resultC = TextEditingController();
  final from = ''.obs;
  final to = ''.obs;

  Future<void> askQuestion() async {
    if (textC.text.trim().isNotEmpty) {
      // final res = await ChatApi.getAnswer(textC.text);

      textC.text = '';
    } else {
      MyDialog.info('Ask Something!');
    }
  }
}

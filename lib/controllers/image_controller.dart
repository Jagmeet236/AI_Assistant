import 'package:arti_genius/helper/helper.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Status { none, loading, complete }

class ImageController extends GetxController {
  final imageC = TextEditingController();

  final status = Status.none.obs;

  String url = '';

  Future<void> createAIImage() async {
    OpenAI.apiKey = apiKey;
    if (imageC.text.trim().isNotEmpty) {
      status.value = Status.loading;
      OpenAIImageModel image = await OpenAI.instance.image.create(
        prompt: imageC.text,
        n: 1,
        size: OpenAIImageSize.size512,
        responseFormat: OpenAIImageResponseFormat.url,
      );
      url = image.data[0].url.toString();
      imageC.text = '';
      status.value = Status.complete;
    } else {
      MyDialog.info(
        'Provide some beautiful image description!',
      );
    }
  }
}

import 'dart:io';
import 'package:gallery_saver_updated/gallery_saver.dart';
import 'package:arti_genius/helper/helper.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';

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

  void downloadImage() async {
    try {
      //To show loading
      MyDialog.showLoadingDialog();

      // PrimaryScrollController.none('url: $url');

      final bytes = (await get(Uri.parse(url))).bodyBytes;
      final dir = await getTemporaryDirectory();
      final file = await File('${dir.path}/ai_image.png').writeAsBytes(bytes);

      print('filePath: ${file.path}');
      //save image to gallery
      await GallerySaver.saveImage(file.path, albumName: appName)
          .then((success) {
        //hide loading
        Get.back();

        MyDialog.success('Image Downloaded to Gallery!');
      });
    } catch (e) {
      //hide loading
      Get.back();
      MyDialog.error('Something Went Wrong (Try again in sometime)!');
      print('downloadImageE: $e');
    }
  }
}

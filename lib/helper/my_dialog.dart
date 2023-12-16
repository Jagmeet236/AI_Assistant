import 'package:arti_genius/helper/helper.dart';
import 'package:get/get.dart';

class MyDialog {
  //info
  static void info(String message) {
    Get.snackbar(
      'Info',
      message,
      snackStyle: SnackStyle.FLOATING,
      backgroundColor: blueColor.withOpacity(.8),
      colorText: whiteColor,
    );
  }

  //success
  static void success(String message) {
    Get.snackbar(
      'Success',
      message,
      snackStyle: SnackStyle.FLOATING,
      backgroundColor: greenColor.withOpacity(.8),
      colorText: whiteColor,
    );
  }

  //error
  static void error(String message) {
    Get.snackbar(
      'Error',
      message,
      snackStyle: SnackStyle.FLOATING,
      backgroundColor: redColor.withOpacity(.8),
      colorText: whiteColor,
    );
  }
}

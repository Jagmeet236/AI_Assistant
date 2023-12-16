// Define your constant theme

import 'package:arti_genius/helper/global_constant.dart';
import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0.5,
      titleTextStyle: googleBoldTextStyle(size: 20, color: blueColor)),
  iconTheme: const IconThemeData(color: blueColor),
  // Material 3 settings
  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

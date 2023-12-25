// Define your constant theme

import 'package:arti_genius/helper/global_constant.dart';
import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    elevation: 0.5,
    iconTheme: IconThemeData(color: blueColor),
  ),
  // Material 3 settings
  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

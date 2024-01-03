// Define your constant theme

import 'package:arti_genius/helper/global_constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Light Theme
ThemeData lightTheme = ThemeData(
  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: 0.5,
    titleTextStyle: TextStyle(
        color: blueColor,
        fontSize: 20,
        fontFamily: GoogleFonts.robotoMono().fontFamily),
    iconTheme: const IconThemeData(color: blueColor),
  ),
  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  brightness: Brightness.light,
);

// Dark Theme
ThemeData darkTheme = ThemeData(
  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: 0.5,
    titleTextStyle: TextStyle(
        color: whiteColor,
        fontSize: 20,
        fontFamily: GoogleFonts.robotoMono().fontFamily),
    iconTheme: const IconThemeData(
      color: whiteColor,
    ),
  ),
  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  brightness: Brightness.dark,
);

extension AppTheme on ThemeData {
  Color get lightTextColor =>
      brightness == Brightness.dark ? white70 : blackColor;
  Color get buttonColor =>
      brightness == Brightness.dark ? cyanColor : blueColor;
}

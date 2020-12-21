import 'dart:io';

import 'package:bipolartest/global/utils/appcolors.dart';
import 'package:bipolartest/global/utils/constants.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.deepOrange,
  primaryColor: AppColors.primaryColor,
  scaffoldBackgroundColor: AppColors.scaffoldColor,
  fontFamily: AppConstants.primaryFont,
  appBarTheme: AppBarTheme(
    brightness: Platform.isIOS ? Brightness.light : Brightness.dark,
    color: AppColors.appBarColor,
    elevation: 0,
    iconTheme: IconThemeData(
      color: Colors.black54,
    ),
    textTheme: TextTheme(
      headline6: TextStyle(
        color: Colors.black54,
        fontFamily: AppConstants.primaryFont,
      ),
    ),
  ),
  colorScheme: ColorScheme.light(
    primary: Colors.white,
    onPrimary: Colors.black87,
    primaryVariant: Colors.white38,
    secondary: AppColors.secondaryColor,
  ),
  iconTheme: IconThemeData(
    color: Colors.black54,
  ),
  textTheme: TextTheme(
    bodyText2: TextStyle(
      color: Colors.grey,
    ),
  ),
);

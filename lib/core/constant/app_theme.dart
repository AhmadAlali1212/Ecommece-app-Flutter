import 'package:ecommeceappcourse/core/constant/color_constant.dart';
import 'package:flutter/material.dart';

ThemeData appThemeEnglish = ThemeData(
  brightness: Brightness.light,
  fontFamily: "PlayfairDisplay",
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: ColorConstant.whitePrimary,
    selectedItemColor: ColorConstant.puplerDistinct,
    unselectedItemColor: ColorConstant.greyPrimary,
  ),
  scaffoldBackgroundColor: ColorConstant.whitePrimary,
  cardTheme: CardThemeData(color: ColorConstant.whitePrimary),
  appBarTheme: AppBarThemeData(
    iconTheme: IconThemeData(color: ColorConstant.puplerDistinct),
    backgroundColor: ColorConstant.whitePrimary,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: ColorConstant.puplerDistinct,
      fontWeight: FontWeight.bold,
      fontSize: 28,
    ),
  ),
  dialogTheme: DialogThemeData(
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.bold,
      color: ColorConstant.puplerDistinct,
    ),
    backgroundColor: ColorConstant.whitePrimary,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: ColorConstant.puplerDistinct,
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      color: ColorConstant.puplerDistinct,
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      color: ColorConstant.puplerLight,
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(color: ColorConstant.greyPrimary, fontSize: 20),
  ),
);
ThemeData appThemeEnglishDark = ThemeData(
  brightness: Brightness.dark,
  fontFamily: "PlayfairDisplay",
  scaffoldBackgroundColor: ColorConstant.blackPrimary,
   bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: ColorConstant.blackPrimary,
    selectedItemColor: ColorConstant.puplerDistinct,
    unselectedItemColor: ColorConstant.greyPrimary,
  ),
  cardTheme: CardThemeData(color: ColorConstant.blackPrimary),
  appBarTheme: AppBarThemeData(
    iconTheme: IconThemeData(color: ColorConstant.whitePrimary),
    backgroundColor: ColorConstant.blackPrimary,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: ColorConstant.whitePrimary,
      fontWeight: FontWeight.bold,
      fontSize: 28,
    ),
  ),
  dialogTheme: DialogThemeData(
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.bold,
      color: ColorConstant.whitePrimary,
    ),
    backgroundColor: ColorConstant.blackPrimary,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: ColorConstant.puplerDistinct,
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      color: ColorConstant.whitePrimary,
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      color: ColorConstant.greyPrimary,
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(color: ColorConstant.whitePrimary, fontSize: 20),
  ),
);
ThemeData appThemeArabic = ThemeData(
  brightness: Brightness.light,
  fontFamily: "Cairo",
   bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: ColorConstant.whitePrimary,
    selectedItemColor: ColorConstant.puplerDistinct,
    unselectedItemColor: ColorConstant.greyPrimary,
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      color: ColorConstant.puplerDistinct,
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      color: ColorConstant.puplerLight,
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(color: ColorConstant.greyPrimary, fontSize: 20),
  ),
);
ThemeData appThemeArabicDark = ThemeData(
  brightness: Brightness.dark,
  fontFamily: "Cairo",
  scaffoldBackgroundColor: ColorConstant.blackPrimary,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: ColorConstant.blackPrimary,
    selectedItemColor: ColorConstant.puplerDistinct,
    unselectedItemColor: ColorConstant.greyPrimary,
  ),
  appBarTheme: AppBarThemeData(
    iconTheme: IconThemeData(color: ColorConstant.whitePrimary),
    backgroundColor: ColorConstant.blackPrimary,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: ColorConstant.whitePrimary,
      fontWeight: FontWeight.bold,
      fontSize: 28,
    ),
  ),
  dialogTheme: DialogThemeData(
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.bold,
      color: ColorConstant.whitePrimary,
    ),
    backgroundColor: ColorConstant.blackPrimary,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: ColorConstant.puplerDistinct,
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      color: ColorConstant.whitePrimary,
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      color: ColorConstant.greyPrimary,
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(color: ColorConstant.whitePrimary, fontSize: 20),
  ),
);

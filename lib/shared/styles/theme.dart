import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sala/shared/styles/color.dart';

Color theme1 = Color(0xffffffff);
ThemeData dark = ThemeData(
    primarySwatch: createMaterialColor(CozmoColor2),
    scaffoldBackgroundColor: Color(0xff264B5E),
    appBarTheme: AppBarTheme(
        backgroundColor: Color(0xff264B5E),
        titleTextStyle: TextStyle(
          color: Color(0xfffff5dd),
          fontSize: 22,
          fontWeight: FontWeight.bold,
          letterSpacing: 3,
        ),
        iconTheme: IconThemeData(color: Color(0xfffff5dd)),
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0xfffff5dd),
            statusBarIconBrightness: Brightness.dark)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xff2f5a72),
      selectedItemColor: Color(0xfffff5dd),
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: false,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Color(0xfffff5dd),
      foregroundColor: Color(0xff264B5E),
    ),
    textTheme: TextTheme(
        bodyText1: TextStyle(
            fontSize: 18,
            color: Color(0xfffaecd2),
            fontWeight: FontWeight.w500)),
    fontFamily: 'jannah');
ThemeData light = ThemeData(
    primarySwatch: createMaterialColor(CozmoColor2),
    scaffoldBackgroundColor: theme1,
    drawerTheme: DrawerThemeData(backgroundColor: CozmoColor),
    appBarTheme: AppBarTheme(
        backgroundColor: theme1,
        titleTextStyle: TextStyle(
          color: Color(0xff264B5E),
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        elevation: 0,
        iconTheme: IconThemeData(color: CozmoColor6),
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: CozmoColor,
            statusBarIconBrightness: Brightness.light)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: CozmoColor3,
        selectedItemColor: Colors.white,
        unselectedItemColor: CozmoColor1,
        showUnselectedLabels: false,
        elevation: 70),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: CozmoColor2, foregroundColor: Colors.white),
    textTheme: TextTheme(
        bodyText1: TextStyle(
            fontSize: 18,
            color: Color(0xff264B5E),
            fontWeight: FontWeight.w500)),
    fontFamily: 'jannah');

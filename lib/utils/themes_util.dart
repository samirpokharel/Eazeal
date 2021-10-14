import 'package:eazeal/config/constants.dart';
import 'package:flutter/material.dart';

class ThemeUtils {
  static TextTheme lightTextTheme = const TextTheme(
    bodyText1: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline1: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline2: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headline3: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    button: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    subtitle1: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: Color(0xFF6A6A6A),
    ),
    subtitle2: TextStyle(
      fontSize: 13.0,
      fontWeight: FontWeight.w400,
      color: Color(0xFF7B7B7B),
    ),
  );

  static TextTheme darkTextTheme = const TextTheme(
    bodyText1: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      color: Colors.white60,
    ),
    headline1: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline2: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline3: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    button: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    subtitle1: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: Colors.white54,
    ),
    subtitle2: TextStyle(
      fontSize: 13.0,
      fontWeight: FontWeight.w400,
      color: Colors.white54,
    ),
  );

  static InputDecorationTheme inputDecorationThemeLight = InputDecorationTheme(
    enabledBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.red),
    ),
    focusedBorder: InputBorder.none,
    filled: true,
    fillColor: const Color(0xffF1F3F5),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
  );

  static InputDecorationTheme inputDecorationThemeDark = InputDecorationTheme(
    enabledBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.red),
    ),
    focusedBorder: InputBorder.none,
    filled: true,
    fillColor: Colors.grey[900],
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
  );

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) => Colors.black),
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: .5
      ),
      tabBarTheme: const TabBarTheme(
        labelColor: primaryColor,
        unselectedLabelColor: Color(0xffABABAB),
      ),
      inputDecorationTheme: inputDecorationThemeLight,
      primaryColor: primaryColor,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey[500],
      ),
      textTheme: lightTextTheme,
    );
  }

  // 4
  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey[900],
        elevation: .5

      ),
      inputDecorationTheme: inputDecorationThemeDark,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: primaryColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey[300],
      ),
      textTheme: darkTextTheme,
    );
  }
}

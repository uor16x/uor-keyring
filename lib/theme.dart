import 'package:flutter/material.dart';

const Color mainColor = Color.fromARGB(44, 98, 110, 124);
const Color mainOverlappingColor = Color.fromARGB(255, 26, 30, 34);
const Color secondaryColor = Color.fromARGB(225, 255, 255, 255);

ThemeData getTheme() {
  return ThemeData.dark().copyWith(
    cardColor: mainColor,
    canvasColor: mainOverlappingColor,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: mainOverlappingColor,
    ),
    indicatorColor: secondaryColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: secondaryColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.only(top: 12, bottom: 12),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: const BorderSide(color: secondaryColor, width: 1.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(mainColor),
      ),
    ),
    appBarTheme: const AppBarTheme(
      color: mainColor,
    ),
    scaffoldBackgroundColor: mainColor,
  );
}

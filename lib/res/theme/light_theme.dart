

import 'package:flutter/material.dart';
import 'package:pos/res/color/app_color.dart';

class LightTheme{

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.white,
    useMaterial3: true,
    /// appbar theme
    appBarTheme:  const AppBarTheme(
      backgroundColor: AppColor.primaryColor,
      titleTextStyle: TextStyle(
        color: AppColor.white,
        fontWeight: FontWeight.w500,
        fontSize: 16
      ),
      iconTheme: IconThemeData(color: AppColor.white),
    ),

    /// drawer theme
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColor.white,
    ),

    /// extension tile theme
    expansionTileTheme: ExpansionTileThemeData(
      collapsedIconColor: AppColor.primaryColor,
      shape: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(1),
        borderSide: BorderSide.none,
      ),
    ),

    /// text input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: AppColor.primaryColor,
          )
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(
          color: AppColor.primaryColor,
          width: 2.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(
          color: AppColor.primaryColor,
          width: 1.5,
        ),
      ),
      hintStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),
      suffixIconColor: AppColor.primaryColor,
      prefixIconColor: AppColor.primaryColor,
      contentPadding: const EdgeInsets.symmetric(
        vertical: 15.0, horizontal: 20.0, // Padding inside the textfield
      ),
    ),

    /// floating action button theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColor.primaryColor,
      foregroundColor: AppColor.white,
      shape: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),

    /// dialog theme
    dialogTheme: DialogTheme(
      titleTextStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: AppColor.white,
      ),
      shape: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),

    /// elevation button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          color: AppColor.white,
        ),
        foregroundColor: AppColor.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        backgroundColor: AppColor.primaryColor,
        minimumSize: Size(100, 40)
      ),
    ),
  );
}
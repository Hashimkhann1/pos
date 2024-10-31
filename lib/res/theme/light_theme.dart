

import 'package:flutter/material.dart';
import 'package:pos/res/color/app_color.dart';

class LightTheme{

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.white,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.white,
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColor.white,
    ),
    expansionTileTheme: ExpansionTileThemeData(
      collapsedIconColor: AppColor.primaryColor,
      shape: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(1),
        borderSide: BorderSide.none,
      ),
    ),
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
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      suffixIconColor: AppColor.primaryColor,
      prefixIconColor: AppColor.primaryColor,
      contentPadding: const EdgeInsets.symmetric(
        vertical: 15.0, horizontal: 20.0, // Padding inside the textfield
      ),
    ),
  );
}
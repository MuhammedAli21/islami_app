import 'package:flutter/material.dart';
import 'package:islami_v1/app_colors.dart';

class MyThemeData {
  // light mode, dark mode, colors,
  // final => used in run time

  static final ThemeData lightMode = ThemeData(
      primaryColor: AppColors.primaryLightColor,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: AppColors.blackColor,
          )),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          color: AppColors.blackColor,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(
          color: AppColors.blackColor,
          fontSize: 25,
          fontWeight: FontWeight.w700,
        ),
        bodySmall: TextStyle(
          color: AppColors.blackColor,
          fontSize: 22,
          fontWeight: FontWeight.bold,
          height: 2,
        ),
        titleLarge: TextStyle(
          color: AppColors.blackColor,
          fontSize: 20,
          fontWeight: FontWeight.w400,
          height: 2,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.primaryLightColor,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedItemColor: AppColors.blackColor,
        unselectedItemColor: AppColors.whiteColor,
        selectedIconTheme: IconThemeData(
          size: 40,
        ),
        unselectedIconTheme: IconThemeData(
          size: 40,
        ),
      ));

  static final ThemeData darkMode = ThemeData(
      primaryColor: AppColors.primaryDarkColor,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: AppColors.whiteColor,
          )),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          color: AppColors.yellowColor,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 25,
          fontWeight: FontWeight.w700,
        ),
        bodySmall: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 22,
          fontWeight: FontWeight.bold,
          height: 2,
        ),
        titleLarge: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 20,
          fontWeight: FontWeight.w400,
          height: 2,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.primaryDarkColor,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedItemColor: AppColors.yellowColor,
        unselectedItemColor: AppColors.whiteColor,
        selectedIconTheme: IconThemeData(
          size: 40,
        ),
        unselectedIconTheme: IconThemeData(
          size: 40,
        ),
      ));
}

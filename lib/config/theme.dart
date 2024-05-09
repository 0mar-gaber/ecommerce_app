
import 'package:flutter/material.dart';
import '../core/utils/colors.dart';

class AppTheme{
  static ThemeData theme =ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor,
        background: AppColors.backGroundColor,
        primary: AppColors.primaryColor,
    ),
    scaffoldBackgroundColor: AppColors.backGroundColor,
    appBarTheme: const AppBarTheme(
      color: AppColors.primaryColor,
      centerTitle: true,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      // selectedItemColor: AppColors.secondaryColor,
      // unselectedItemColor: AppColors.unselectedIconColor,
      // backgroundColor: AppColors.bottomNavigationBarColor,
    ),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,



  );

}

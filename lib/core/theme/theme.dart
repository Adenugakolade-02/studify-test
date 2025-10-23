import 'package:flutter/material.dart';
import 'package:studify/core/theme/color.dart';

class AppTheme{
  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: AppColors.whiteBackground,
    fontFamily: 'Satoshi',
    iconTheme: IconThemeData(
      color: AppColors.iconGrey,
      size: 24
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.whiteBackground,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w700,
        color: AppColors.textSecondary,
        fontFamily: 'Satoshi'
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData( //Serves as the base for designing the gradient button
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        minimumSize: Size.fromHeight(43),
        textStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: AppColors.whiteBackground
        ),
        iconColor: AppColors.whiteBackground,
        iconSize: 17
      )
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryPurple,
        textStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          fontFamily: 'Inter'
        ),
        padding: EdgeInsets.zero
      )
    )
  );

  static ThemeData dark = ThemeData();
}
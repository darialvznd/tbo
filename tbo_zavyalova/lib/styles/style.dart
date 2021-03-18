import 'package:flutter/material.dart';

class AppColor {
  static const Color primary = Color(0xFFF18C43);
  static const Color onPrimary = Color.fromRGBO(255, 255, 255, 1);
  static const Color onSurfaceHighEmphasis = Color.fromRGBO(0, 0, 0, 0.87);
  static const Color onSurfaceMediumEmphasis = Color.fromRGBO(0, 0, 0, 0.6);
  static const Color fieldDescriptionColor = Color.fromRGBO(0, 0, 0, 0.45);
  static const Color lowerPrice = Color(0xFFADCD99);
  static const Color categoryColor = Color.fromRGBO(8, 7, 7, 0.68);
  static const Color textPrimary = Color(0xFF000000);
  static getThemeData() => ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: AppColor.primary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: AppColor.onPrimary,
      );
}

class AppTextStyle {
  static const TextStyle fieldDescription = const TextStyle(
    color: AppColor.fieldDescriptionColor,
    fontWeight: FontWeight.w500,
    fontSize: 10.0,
    letterSpacing: 1.5,
    height: 1.6,
  );
  static const TextStyle price = const TextStyle(
    color: AppColor.onSurfaceHighEmphasis,
    fontWeight: FontWeight.w400,
    fontSize: 18.0,
    letterSpacing: 0.15,
    height: 1.1,
  );
  static const TextStyle price2 = const TextStyle(
    color: AppColor.onSurfaceHighEmphasis,
    fontWeight: FontWeight.w400,
    fontSize: 24.0,
    letterSpacing: 0.15,
    height: 1.08,
  );
  static const TextStyle button = const TextStyle(
      letterSpacing: 1.25,
      fontWeight: FontWeight.w400,
      fontSize: 24.0,
      color: AppColor.onPrimary,
      height: 1.1);
  static const TextStyle companyName = const TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 16,
      color: AppColor.onSurfaceHighEmphasis,
      letterSpacing: 0.15,
      height: 1.1);
  static const TextStyle category = const TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 16,
      color: AppColor.onSurfaceHighEmphasis,
      letterSpacing: 0.15,
      height: 1.24);
  static const TextStyle fieldBody = const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: AppColor.onSurfaceHighEmphasis,
      letterSpacing: 0.15,
      height: 1.1);
  static const TextStyle urlText = const TextStyle(
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: AppColor.onSurfaceHighEmphasis,
      letterSpacing: 0.15,
      height: 1.1);
  static const TextStyle boldText = const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: AppColor.onSurfaceHighEmphasis,
      letterSpacing: 1.5,
      height: 1.5);
  static const TextStyle state = const TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 10,
      color: AppColor.textPrimary,
      letterSpacing: 1.5,
      height: 1.1);
}

class AppTheme {
  static ThemeData theme = ThemeData(
      primaryColor: AppColor.onPrimary,
      accentColor: AppColor.primary,
      buttonTheme: ButtonThemeData(
        buttonColor: AppColor.primary,
      ));
}

import 'package:flutter/material.dart';

class AppColor {
  static const Color primary = Color(0xFF6200EE);
  static const Color onPrimary = Color.fromRGBO(255, 255, 255, 1);
  // static const Color border = Color(0xFFDFDFDF);
  static const Color onSurfaceHighEmphasis = Color.fromRGBO(0, 0, 0, 0.87);
  static const Color onSurfaceMediumEmphasis = Color.fromRGBO(0, 0, 0, 0.6);
  // static const Color surfaceOverlay = Color.fromRGBO(33, 33, 33, 0.08);
  static const Color fieldDescriptionColor = Color.fromRGBO(0, 0, 0, 0.45);
  // static const Color statesPrimarOverlaySelected =
  //     Color.fromRGBO(98, 0, 238, 0.08);
  // static const Color headlineRed = Color.fromRGBO(189, 0, 0, 1);
  // static const Color headlineTransparent = Color(0x5A000000);
  // static const Color onPrimaryNotifications = Color.fromRGBO(249, 245, 255, 1);
  // static const Color secondary = Color.fromRGBO(3, 218, 197, 1);
  // static const Color newCommentUrgencyIcon = Color.fromRGBO(230, 230, 230, 1);
  // static const Color newCommentUrgencyButton = Color.fromRGBO(139, 137, 137, 1);
  // static const Color onPrimaryMediumEmphasis =
  //     Color.fromRGBO(255, 255, 255, 0.74);
  static const Color categoryColor = Color.fromRGBO(8, 7, 7, 0.68);
  // static const Color blackWithOpasity = Color.fromRGBO(0, 0, 0, 0.5);

  static getThemeData() => ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: AppColor.primary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: AppColor.onPrimary,
      );
}

class AppTextStyle {
  static const TextStyle fieldDescription = const TextStyle(
    // fontFamily: 'Roboto',
    color: AppColor.fieldDescriptionColor,
    fontWeight: FontWeight.w500,
    fontSize: 10.0,
    letterSpacing: 1.5,
    height: 1.6,
    // height: 16.0
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
      fontWeight: FontWeight.w500,
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
}

class AppTheme {
  static ThemeData theme = ThemeData(
      primaryColor: AppColor.onPrimary,
      buttonTheme: ButtonThemeData(
        buttonColor: AppColor.primary,
      ));
}

import 'package:flutter/material.dart';

class AppColor {
  static const Color primary = Color(0xFF6200EE);
  static const Color onPrimary = Color.fromRGBO(255, 255, 255, 1);
  static const Color border = Color(0xFFDFDFDF);
  static const Color onSurfaceHighEmphasis = Color.fromRGBO(0, 0, 0, 0.87);
  static const Color onSurfaceMediumEmphasis = Color.fromRGBO(0, 0, 0, 0.6);
  static const Color surfaceOverlay = Color.fromRGBO(33, 33, 33, 0.08);
  static const Color fieldDescriptionColor = Color.fromRGBO(0, 0, 0, 0.45);
  static const Color statesPrimarOverlaySelected =
      Color.fromRGBO(98, 0, 238, 0.08);
  static const Color headlineRed = Color.fromRGBO(189, 0, 0, 1);
  static const Color headlineTransparent = Color(0x5A000000);
  static const Color onPrimaryNotifications = Color.fromRGBO(249, 245, 255, 1);
  static const Color secondary = Color.fromRGBO(3, 218, 197, 1);
  static const Color newCommentUrgencyIcon = Color.fromRGBO(230, 230, 230, 1);
  static const Color newCommentUrgencyButton = Color.fromRGBO(139, 137, 137, 1);
  static const Color onPrimaryMediumEmphasis =
      Color.fromRGBO(255, 255, 255, 0.74);
  static const Color avatar = Color.fromRGBO(196, 196, 196, 1);
  static const Color blackWithOpasity = Color.fromRGBO(0, 0, 0, 0.5);

  static getThemeData() => ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: AppColor.primary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.blue,
      );
}

class AppTextStyle {
  static const TextStyle taskFieldDescription = const TextStyle(
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
  static const TextStyle button = const TextStyle(
      letterSpacing: 1.25,
      fontWeight: FontWeight.w500,
      fontSize: 14.0,
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
  static const TextStyle body2 = const TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    color: AppColor.onSurfaceHighEmphasis,
    height: 1.42,
  );
  static const TextStyle headline6 = const TextStyle(
      // fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      fontSize: 22,
      color: AppColor.onSurfaceHighEmphasis,
      letterSpacing: 0.15,
      height: 1.2);

  static const TextStyle subtitle1 = const TextStyle(
      // fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: AppColor.onSurfaceHighEmphasis,
      letterSpacing: 0.15);

  static const TextStyle subtitle2 = const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: AppColor.onSurfaceMediumEmphasis,
      letterSpacing: 0.1,
      height: 1.72);

  static const TextStyle body1 = const TextStyle(
      // fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: AppColor.onSurfaceHighEmphasis,
      letterSpacing: 0.5,
      height: 1.5);

  static const TextStyle attachedFiles = const TextStyle(
      // fontFamily: 'Roboto',
      color: AppColor.primary,
      fontWeight: FontWeight.w400,
      fontSize: 16.0,
      letterSpacing: 0.15,
      decoration: TextDecoration.underline,
      height: 1.5);
  static const TextStyle notificationCount = const TextStyle(
    // fontFamily: 'Roboto',
    color: AppColor.primary,
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
    letterSpacing: 0.15,
  );
}

class AppTheme {
//  static ThemeData theme = ThemeData(primaryColor: AppColor.primary, buttonTheme: ButtonThemeData(buttonColor: AppColor.primary,))
}

import 'package:flutter/material.dart';


//padding
const double kDefaultPadding = 10.0;

// ignore: long-method
ThemeData appTheme() {
  const Color primaryColor = Color(0xff1E2022);
  const Color primaryColorLight = Color(0xff2d3033);
  const Color primaryColorDark = Color(0xff070708);
  const Color onPrimaryColor = Color(0xffffffff);

  const Color secondaryColor = Color(0xffF5F5F5);
  const Color secondaryColorLight = Color(0xffF5F5F5);
  const Color secondaryColorDark = Color(0xffF5F5F5);
  const Color onSecondaryColor = Color(0xff000000);

  const Color surfaceColor = Color(0xfff9f9f9);
  const Color onSurfaceColor = Color(0xff000000);

  const Color backgroundColor = Color(0xfff0f5f9);
  const Color onBackgroundColor = Color(0xff000000);

  const Color errorColor = Color(0xffB00020);
  const Color onErrorColor = Color(0xffffffff);

  return ThemeData(
    appBarTheme: const AppBarTheme(
      centerTitle: true,
    ),
    colorScheme: const ColorScheme(
      primary: primaryColor,
      primaryVariant: primaryColorLight,
      secondary: secondaryColor,
      secondaryVariant: secondaryColorLight,
      surface: surfaceColor,
      background: backgroundColor,
      error: errorColor,
      onPrimary: onPrimaryColor,
      onSecondary: onSecondaryColor,
      onSurface: onSurfaceColor,
      onBackground: onBackgroundColor,
      onError: onErrorColor,
      brightness: Brightness.light,
    ),
    brightness: Brightness.light,
    dialogBackgroundColor: backgroundColor,
    primaryColor: primaryColor,
    primaryColorLight: primaryColorLight,
    primaryColorDark: primaryColorDark,
    primaryColorBrightness: Brightness.dark,
    backgroundColor: backgroundColor,
    errorColor: errorColor,
    indicatorColor: primaryColorLight,
    textTheme: const TextTheme(
      headline1: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 96,
          fontWeight: FontWeight.w700
      ),
      headline2: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 60,
          fontWeight: FontWeight.w300
      ),
      headline3: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 48,
          fontWeight: FontWeight.w400
      ),
      headline4: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 36,
          fontWeight: FontWeight.w600
      ),
      headline5: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 24,
          fontWeight: FontWeight.w600
      ),
      headline6: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 24,
          fontWeight: FontWeight.w600
      ),
      bodyText1: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 22,
          fontWeight: FontWeight.normal
      ),
      bodyText2: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 18,
          fontWeight: FontWeight.normal
      ),
      subtitle1: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 20,
          fontWeight: FontWeight.w600
      ),
      subtitle2: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 18,
          fontWeight: FontWeight.normal
      ),
      caption: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 12,
          fontWeight: FontWeight.normal
      ),
      button: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 14,
          fontWeight: FontWeight.w600
      ),
      overline: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 10,
          fontWeight: FontWeight.normal
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
    tabBarTheme: const TabBarTheme(
      indicatorSize: TabBarIndicatorSize.tab,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateColor.resolveWith((
          Set<MaterialState> states) => primaryColor),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateColor.resolveWith((
          Set<MaterialState> states) => primaryColor),
    ),
  );
}

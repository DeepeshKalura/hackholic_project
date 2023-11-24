import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'default_theme.dart';

class AppTheme {
  // Constructor
  AppTheme(this.context);

  // Params
  final BuildContext context;

  // <--- Build light theme --->
  ThemeData lightTheme() {
    return ThemeData.light().copyWith(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: lightThemeBgColor,
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Color(0xFFf6f6f6),
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.transparent,
        actionsIconTheme: IconThemeData(
          color: lightThemeTextColor.withOpacity(0.50),
        ),
        titleTextStyle: const TextStyle(
          color: lightThemeTextColor,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      iconTheme: const IconThemeData(color: lightThemeTextColor, size: 28),
      textTheme: GoogleFonts.dmSansTextTheme(customTextTheme).apply(
        bodyColor: lightThemeTextColor,
        displayColor: lightThemeTextColor,
      ),
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        secondary: secondaryColor,
        error: errorColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: lightThemeBgColor,
        selectedItemColor: primaryColor,
        selectedIconTheme: const IconThemeData(color: primaryColor, size: 28),
        unselectedItemColor: lightThemeTextColor.withOpacity(0.5),
        showUnselectedLabels: true,
      ),
      inputDecorationTheme: inputDecorationTheme,
      elevatedButtonTheme: elevatedButtonTheme,
      outlinedButtonTheme: outlinedButtonTheme,
    );
  }

  // Build Custom TextTheme
  TextTheme get customTextTheme => const TextTheme(
        headlineSmall: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        titleLarge: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        titleMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
        bodyLarge: TextStyle(fontSize: 16.0),
        bodyMedium: TextStyle(fontSize: 14.0),
        bodySmall: TextStyle(fontSize: 12.0),
      );

  final inputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: greyLight,
    focusColor: primaryColor,
    hintStyle: const TextStyle(color: Colors.grey),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: defaultPadding,
      vertical: defaultPadding,
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(50),
    ),
  );

  final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultRadius * 2),
      ),
    ),
  );

  final outlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(width: 1.5, color: primaryColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultRadius * 2),
      ),
    ),
  );
}

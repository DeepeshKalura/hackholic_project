import 'package:flutter/material.dart';

// Primary and secondary colors
// Note: These are the most important colors,
// especially the primary one, which defines the theme of your app.
const Color primaryColor = Color(0xFF8041C6);
const Color secondaryColor = Color(0xFF000000);

//
// Be careful when changing others below unless you have a specific need.
//

// Other colors
const Color greyLight = Color(0xFFF5F5F5);
const Color greyColor = Color(0xFF9E9E9E);
const Color errorColor = Colors.red;

// <-- Light Theme Colors -->
const Color lightThemeBgColor = Color(0xFFFFFFFF);
const Color lightThemeTextColor = Color(0xFF4d4c53);

// Other defaults
const double defaultPadding = 16.0;
const double defaultMargin = 16.0;
const double defaultRadius = 16.0;

/// Default Border Radius
final BorderRadius borderRadius = BorderRadius.circular(defaultRadius);

/// Default Bottom Sheet Radius
const BorderRadius bottomSheetRadius = BorderRadius.only(
  topLeft: Radius.circular(defaultRadius),
  topRight: Radius.circular(defaultRadius),
);

/// Default Top Sheet Radius
const BorderRadius topSheetRadius = BorderRadius.only(
  bottomLeft: Radius.circular(defaultRadius),
  bottomRight: Radius.circular(defaultRadius),
);

/// Default Box Shadow
final List<BoxShadow> boxShadow = [
  BoxShadow(
    blurRadius: 10,
    spreadRadius: 0,
    offset: const Offset(0, 2),
    color: Colors.black.withOpacity(0.04),
  ),
];

const Duration duration = Duration(milliseconds: 300);

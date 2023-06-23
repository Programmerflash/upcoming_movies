import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  ThemeMode themeMode = ThemeMode.system;
}

class AppThemes {
  static const Color _primary = Color.fromRGBO(8, 167, 255, 1);
  static const Color _secondary = Color.fromRGBO(2, 122, 190, 1);
  static const Color _darkBgColor = Color.fromRGBO(25, 26, 27, 1);
  static final ThemeData dark = ThemeData(
    sliderTheme: SliderThemeData(
        overlayShape: SliderComponentShape.noOverlay,
        trackShape: const RectangularSliderTrackShape(),
        thumbShape: SliderComponentShape.noOverlay),
    scaffoldBackgroundColor: _darkBgColor,
    primaryColor: _primary,
    iconTheme: const IconThemeData(color: Colors.white),
    dividerTheme: const DividerThemeData(color: Colors.grey, thickness: 0.5),
    listTileTheme: const ListTileThemeData(
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      horizontalTitleGap: 10,
    ),
    colorScheme: const ColorScheme.dark(
      primary: _primary,
      secondary: _secondary,
    ),
    cardColor: _darkBgColor.withOpacity(0.9),
    shadowColor: Colors.white,
  );

  static final ThemeData light = ThemeData(
    sliderTheme: SliderThemeData(
        overlayShape: SliderComponentShape.noOverlay,
        trackShape: const RectangularSliderTrackShape(),
        thumbShape: SliderComponentShape.noOverlay),
    scaffoldBackgroundColor: const Color(0xffF6F6FA),
    primaryColor: _primary,
    iconTheme: const IconThemeData(color: Colors.black),
    dividerTheme: const DividerThemeData(color: Colors.grey, thickness: 0.5),
    listTileTheme: const ListTileThemeData(
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      horizontalTitleGap: 10,
    ),
    colorScheme: const ColorScheme.light(
      primary: _primary,
      secondary: _secondary,
    ),
    primaryTextTheme: GoogleFonts.poppinsTextTheme(),
    cardColor: Colors.white,
    shadowColor: Colors.black,
  );
}

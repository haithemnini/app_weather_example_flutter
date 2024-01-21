import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// A class that defines the app themes for the weather app.
///
/// This class provides static instances of [ThemeData] for light and dark themes.
/// The light theme has a white scaffold background color and uses the Rubik font for text.
/// The dark theme has a black scaffold background color and also uses the Rubik font for text.
@immutable
class AppThemes {
  const AppThemes._();

  /// The light theme for the app.
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme: GoogleFonts.rubikTextTheme(
      ThemeData.light().textTheme,
    ),
  );

  /// The dark theme for the app.
  static final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
    textTheme: GoogleFonts.rubikTextTheme(
      ThemeData.dark().textTheme,
    ),
  );
}

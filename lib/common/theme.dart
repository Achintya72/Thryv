import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData thryvTheme = ThemeData(
  useMaterial3: true,
  // not working - colorScheme: ColorScheme.fromSwatch(primarySwatch: blue),
  scaffoldBackgroundColor: white.shade50,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    unselectedItemColor: Color(0xFF727272),
  ),
  canvasColor: const Color(0xFFFFFFFF),
  textTheme: TextTheme(
      displayMedium: GoogleFonts.getFont("DM Serif Text").copyWith(fontSize: 36, fontWeight: FontWeight.w400, letterSpacing: 0),
      displaySmall: GoogleFonts.getFont("DM Serif Text").copyWith(fontSize: 20, fontWeight: FontWeight.w400, letterSpacing: 0),
      titleLarge:
          GoogleFonts.getFont("Poppins").copyWith(fontSize: 20, fontWeight: FontWeight.w600, height: 1.2, letterSpacing: 0),
      titleMedium:
          GoogleFonts.getFont("DM Serif Text").copyWith(fontSize: 16, height: 1.2, fontWeight: FontWeight.w400, letterSpacing: 0),
      titleSmall:
          GoogleFonts.getFont("DM Serif Text").copyWith(fontSize: 14, height: 1.2, fontWeight: FontWeight.w400, letterSpacing: 0),
      labelLarge:
          GoogleFonts.getFont("Poppins").copyWith(fontSize: 16, fontWeight: FontWeight.w600, height: 1.2, letterSpacing: 0),
      labelMedium:
          GoogleFonts.getFont("Poppins").copyWith(fontSize: 14, fontWeight: FontWeight.w600, height: 1.2, letterSpacing: 0),
      labelSmall:
          GoogleFonts.getFont("Poppins").copyWith(fontSize: 12, fontWeight: FontWeight.w700, height: 1.2, letterSpacing: 0),
      bodyLarge:
          GoogleFonts.getFont("Poppins").copyWith(fontSize: 16, fontWeight: FontWeight.w400, height: 1.2, letterSpacing: 0),
      bodyMedium:
          GoogleFonts.getFont("Poppins").copyWith(fontSize: 14, fontWeight: FontWeight.w400, height: 1.2, letterSpacing: 0),
      bodySmall:
          GoogleFonts.getFont("Poppins").copyWith(fontSize: 12, fontWeight: FontWeight.w400, height: 1.2, letterSpacing: 0)),
);

const Map<int, Color> greenSwatch = <int, Color>{
  100: Color(0xFFEFFFFD),
  700: Color(0xFF4CD8C8),
};

const Map<int, Color> blueSwatch = <int, Color>{
  100: Color(0xFFE2ECF0),
  700: Color(0xFF114B5D),
};

const Map<int, Color> orangeSwatch = <int, Color>{
  100: Color(0xFFFFEAD2),
  700: Color(0xFFFF9F2D),
};

const Map<int, Color> pinkSwatch = <int, Color>{
  50: Color(0xFFFFEBF4),
  100: Color(0xFFFFDDED),
  200: Color(0xFFFFBBDA),
  300: Color(0xFFFF99CB),
  400: Color(0xFFAA6685),
  500: Color(0xFF553343),
  600: Color(0xFF331F28)
};

const Map<int, Color> whiteSwatch = <int, Color>{
  50: Color(0xFFFAFAFA),
  100: Color(0xFFF6F6F6),
  200: Color(0xFFF1F1F1),
  300: Color(0xFFE9E9E9),
  400: Color(0xFFE4E4E4),
  500: Color(0xFFBEBEBE),
  600: Color(0xFF989898),
  700: Color(0xFF727272),
  800: Color(0xFF4C4C4C),
  900: Color(0xFF2E2E2E),
};

const MaterialColor green = MaterialColor(0xFF4CD8C8, greenSwatch);
const MaterialColor blue = MaterialColor(0xFF114B5D, blueSwatch);
const MaterialColor orange = MaterialColor(0xFFFF9F2D, orangeSwatch);
const MaterialColor pink = MaterialColor(0xFFFF99CB, pinkSwatch);

const MaterialColor white = MaterialColor(0xFFE4E4E4, whiteSwatch);

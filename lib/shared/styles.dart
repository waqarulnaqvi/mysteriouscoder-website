import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Gradient reusableAppBarGradient(BuildContext context) {
  return LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Theme.of(context).colorScheme.primary,
      Theme.of(context).colorScheme.primaryContainer,
    ],
  );
}

TextStyle reusableTextStyle({double fontSize = 18,Color color =Colors.white}) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: fontSize,
    fontFamily: GoogleFonts.dynaPuff().fontFamily,
    color: color,
  );
}
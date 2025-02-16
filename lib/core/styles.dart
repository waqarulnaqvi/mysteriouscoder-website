import 'package:flutter/material.dart';

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
    fontFamily: "Montserrat",
    // fontFamily: GoogleFonts.dynaPuff().fontFamily,
    color: color,
  );
}


const primaryColor = Color(0xFF09FBD3);
const secondaryColor = Color(0xFFFE53BB);

const textColor = Color(0xFF2B2B2B);
const lightGrayColor = Color(0x44948282);
const whiteColor = Color(0xFFFFFFFF);
const blackColor = Color(0xFF2B2B2B);


Color lightBackgroundColor = const Color(0xFFFFFFFF);
Color lightTextColor = const Color(0xFF403930);
Color darkBackgroundColor = const Color(0xFF2B2B2B);
Color darkTextColor = const Color(0xFFF3F2FF);


const pinkPurple = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [Color(0XFFaa367c), Color(0XFF4a2fbd)],
);

const themeGradient = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [ Color.fromRGBO(37, 146, 166, 1) ,Color.fromRGBO(74, 171, 189, 1.0)],
);

const grayBlack = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0XFF2E2D36), Color(0XFF11101D)],
);
const grayWhite = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFFFFF), Color(0xFFF3F2FF)],
);

const buttonGradi = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [Color(0XFF7DE7EB), Color(0XFF33BBCF)],
);

const contactGradi = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [Color(0XFF2E2D36), Color(0XFF11101D)],
);

//
BoxShadow primaryColorShadow = BoxShadow(
  color: primaryColor.withAlpha(100),
  blurRadius: 12.0,
  offset: const Offset(0.0, 0.0),
);

BoxShadow blackColorShadow = BoxShadow(
  color: Colors.black.withAlpha(100),
  blurRadius: 12.0,
  offset: const Offset(0.0, 0.0),
);

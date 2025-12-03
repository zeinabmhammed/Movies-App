import 'dart:ui';
import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';
import '../AppFonts/AppFonts.dart';

TextStyle _getTextStyle({
  required double fontSize,
  required FontWeight fontWeight,
  required Color color,
}) {
  switch (FontConfig.defaultFont) {
    case AppFont.roboto:
      return GoogleFonts.roboto(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      );
    case AppFont.inter:
      return GoogleFonts.inter(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      );
  }
}

// 1. size: 24 , weight : 700 , style : bold
TextStyle s24Bold({required Color color}) => _getTextStyle(
  fontSize: FontSize.s24,
  fontWeight: FontWeightManager.bold,
  color: color,
);

// 2. size: 20 , weight : 700 , style : bold
TextStyle s20Bold({required Color color}) => _getTextStyle(
  fontSize: FontSize.s20,
  fontWeight: FontWeightManager.bold,
  color: color,
);

// 3. size: 16 , weight : 400 , style : regular
TextStyle s16Regular({required Color color}) => _getTextStyle(
  fontSize: FontSize.s16,
  fontWeight: FontWeightManager.regular,
  color: color,
);

// 4. size: 20 , weight : 400 , style : regular
TextStyle s20Regular({required Color color}) => _getTextStyle(
  fontSize: FontSize.s20,
  fontWeight: FontWeightManager.regular,
  color: color,
);

// 5. size: 15 , weight : 400 , style : regular
TextStyle s15Regular({required Color color}) => _getTextStyle(
  fontSize: FontSize.s15,
  fontWeight: FontWeightManager.regular,
  color: color,
);

// 6. size: 16 , weight : 400 , style : regular
TextStyle s16RegularAlt({required Color color}) => _getTextStyle(
  fontSize: FontSize.s16,
  fontWeight: FontWeightManager.regular,
  color: color,
);

// 7. size: 14 , weight : 900 , style : black
TextStyle s14Black({required Color color}) => _getTextStyle(
  fontSize: FontSize.s14,
  fontWeight: FontWeightManager.black,
  color: color,
);

// 8. size: 14 , weight : 400 , style : regular
TextStyle s14Regular({required Color color}) => _getTextStyle(
  fontSize: FontSize.s14,
  fontWeight: FontWeightManager.regular,
  color: color,
);
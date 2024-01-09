import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/theme/color_selection.dart';
import 'package:google_fonts/google_fonts.dart';

// default icons is icons rounded

const ColorScheme colorSchemeData = ColorScheme(
  primary: ColorsConst.primary,
//  primaryVariant: ColorsConst.blackFour,
  secondary: ColorsConst.secoundary,
// secondaryVariant: ColorsConst.blackFive,
  surface: ColorsConst.white,
  background: ColorsConst.backgroundColor,
  error: ColorsConst.warning,
  onPrimary: ColorsConst.blackFive,
  onSecondary: ColorsConst.blackThree,
  onSurface: Color(0xFF000000),
  onBackground: ColorsConst.black,
  onError: ColorsConst.white,
  brightness: Brightness.light,
);

final extraTheme = GoogleFonts.poppins(
  fontSize: 8,
  color: ColorsConst.blackThree,
  fontWeight: FontWeight.w300,
);
final extraLargeTheme = GoogleFonts.poppins(
  fontSize: 12,
  color: ColorsConst.primary,
  fontWeight: FontWeight.w700,
);
final appBarTittleStyle = GoogleFonts.poppins(
  fontSize: 16,
  color: ColorsConst.appBartitleColor,
  fontWeight: FontWeight.w500,
);
final textThemeData = TextTheme(
  // poppins 500 24
  headline1: GoogleFonts.poppins(
    fontSize: 24,
    color: ColorsConst.black,
    fontWeight: FontWeight.w500,
    letterSpacing: -0.5,
  ),

  // 400 8

  // labelSmall: GoogleFonts.poppins(
  //   fontSize: 8,
  //   color: ColorsConst.blackThree,
  //   fontWeight: FontWeight.w400,
  // ),
  // 700 28 new
  headline2: GoogleFonts.poppins(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: ColorsConst.secoundary,
  ),
  // 700 24 new
  headline3: GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: ColorsConst.secoundary,
  ),
  // 600 14 new
  headline4: GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.25,
    color: ColorsConst.black,
  ),
  // 700 15 montersat new
  headline5: GoogleFonts.montserrat(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: ColorsConst.secoundary,
  ),
  // 400 20 dm sans new
  headline6: GoogleFonts.dmSans(
      fontSize: 12, fontWeight: FontWeight.w400, color: ColorsConst.black2),
  // poppins 500 12
  subtitle1: GoogleFonts.poppins(
      fontSize: 12, fontWeight: FontWeight.w500, color: ColorsConst.blackThree),
  // 500 15 new
  subtitle2: GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: ColorsConst.black,
  ),

  // 600 12 new montersat
  bodyText1: GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: ColorsConst.secoundary,
  ),
// 400 14 new
  bodyText2: GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ColorsConst.black.withOpacity(0.4),
  ),
  // 600 10 new
  button: GoogleFonts.poppins(
      fontSize: 13, fontWeight: FontWeight.w600, color: ColorsConst.white),
  // poppins 400 12
  caption: GoogleFonts.poppins(
    fontSize: 12,
    letterSpacing: 0.3,
    fontWeight: FontWeight.w500,
    color: ColorsConst.blackThree,
  ),
  // 400 15 new
  overline: GoogleFonts.poppins(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: ColorsConst.blackThree,
      letterSpacing: 0.5),
);

// BorderRadius get miniBoxCornerRadius => BorderRadius.circular(4);
BorderRadius get miniBoxCornerRadius => BorderRadius.circular(10);
BorderRadius get largeBoxCornerRadius => BorderRadius.circular(12);
BorderRadius get smallBoxCornerRadius => BorderRadius.circular(5);
BorderRadius get verysmallBoxCornerRadius => BorderRadius.circular(2);
BorderRadius get extraLargeBoxCornerRadius => BorderRadius.circular(20);
// BorderRadius get smallBoxCornerRadius => BorderRadius.circular(3);
// BorderRadius get extrasmallBoxCornerRadius => BorderRadius.circular(2);
BoxDecoration get monoBoxCorner {
  return BoxDecoration(borderRadius: miniBoxCornerRadius);
}

// BorderRadius get smallBorderRadius => BorderRadius.circular(3);
// BoxDecoration get smallboxCorner {
//   return BoxDecoration(borderRadius: smallBoxCornerRadius);
// }

const SystemUiOverlayStyle lightTaskBar = SystemUiOverlayStyle(
  statusBarColor: ColorsConst.white,
  statusBarIconBrightness:
      Brightness.dark, //<-- For Android SEE HERE (dark icons)
  statusBarBrightness: Brightness.light,
);

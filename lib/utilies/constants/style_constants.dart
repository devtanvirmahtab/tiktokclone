

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';


TextStyle headerTextStyle({
  fontSize = 35.0,
  fontWeight = FontWeight.bold,
  color = buttonColor
}){
  return GoogleFonts.raleway(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
  );
}

TextStyle subHeaderTextStyle({
  double fontSize = 24.0,
  fontWeight = FontWeight.w600,
  color = buttonColor
}){
  return GoogleFonts.raleway(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
  );
}

TextStyle normalTextStyle({
  fontSize = 16.0,
  fontWeight = FontWeight.w400,
  color = whiteColor
}){
  return GoogleFonts.raleway(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
  );
}


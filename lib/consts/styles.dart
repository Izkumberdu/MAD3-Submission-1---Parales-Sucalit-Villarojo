
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kWhite = Color(0xFFFFFFFF);
const Color black = Color(0xFF000000);
const Color orange = Color(0xFFFE8570);
const Color lightOrange = Color(0xFFFBEDE8);

final interBold = GoogleFonts.inter(
  color: black,
  fontWeight: FontWeight.w700,
);
final interItalicBold = GoogleFonts.inter(
  color: black,
  fontWeight: FontWeight.w700,
  textStyle: const TextStyle(fontStyle: FontStyle.italic),
);
final interItalic = GoogleFonts.inter(
    color: black,
    textStyle: const TextStyle(fontStyle: FontStyle.italic),
    fontWeight: FontWeight.w400);

final interRegular = GoogleFonts.inter(
  color: black,
  fontWeight: FontWeight.w400,
);

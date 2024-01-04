import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  String? text;
  double? fontSize;
  FontWeight? fontWeight;
  MyText({super.key, this.text, this.fontSize, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: GoogleFonts.notoSans(
          fontSize: fontSize ?? 16,
          fontWeight: fontWeight ?? FontWeight.normal),
    );
  }
}
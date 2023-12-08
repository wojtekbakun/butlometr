import 'package:butlometr2/fonts/fonts_settings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NormalText extends StatelessWidget {
  final String text;
  const NormalText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.jetBrainsMono(
        textStyle: TextStyle(
          fontWeight: FontSettings().normalWeight,
        ),
      ),
    );
  }
}

class BoldText extends StatelessWidget {
  final String text;
  const BoldText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.jetBrainsMono(
        textStyle: TextStyle(
          fontWeight: FontSettings().largeWeight,
        ),
      ),
    );
  }
}

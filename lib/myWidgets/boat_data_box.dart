import "package:flutter/material.dart";

import "../fonts/fonts.dart";

class BoatDataBox extends StatelessWidget {
  final String text;
  const BoatDataBox({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return NormalText(
      text: text,
    );
  }
}

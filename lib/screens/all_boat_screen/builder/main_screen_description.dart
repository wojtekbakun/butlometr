import 'package:butlometr2/fonts/fonts.dart';
import 'package:butlometr2/myWidgets/smart_box.dart';
import 'package:flutter/material.dart';

class UpperDescription extends StatelessWidget {
  const UpperDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return const DescriptionFrame(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DescriptionBox(text: 'miejscowość'),
          DescriptionBox(text: 'nazwa łodzi'),
          DescriptionBox(text: 'szczegóły'),
        ],
      ),
    );
  }
}

class DescriptionBox extends StatelessWidget {
  final String text;
  const DescriptionBox({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Center(
        child: BoldText(
          text: text,
        ),
      ),
    );
  }
}

import 'package:butlometr2/fonts/fonts.dart';
import 'package:butlometr2/myWidgets/smart_box.dart';
import 'package:flutter/material.dart';

class UpperDescription extends StatelessWidget {
  const UpperDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return const DescriptionFrame(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //id_boat
          DescriptionBox(text: 'nazwa łodzi'),
          //bottles in use
          DescriptionBox(text: 'uzywane butle [szt.]'),
          //available bootles
          DescriptionBox(text: 'dostępne butle [szt.]'),
          //id_city
          DescriptionBox(text: 'miejscowość'),
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

import 'package:butlometr2/consts/colors.dart';
import 'package:butlometr2/fonts/fonts.dart';
import 'package:butlometr2/myWidgets/smart_box.dart';
import 'package:flutter/material.dart';

class Butlometr extends StatelessWidget {
  const Butlometr({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 80,
        width: 200,
        child: MainBox(
          color: AppColors.accentColor,
          child: Center(
            child: NormalText(
              text: 'B U T L O M E T R',
            ),
          ),
        ),
      ),
    );
  }
}

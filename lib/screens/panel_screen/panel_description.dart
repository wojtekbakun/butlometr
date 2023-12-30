import 'package:butlometr2/fonts/fonts.dart';
import 'package:butlometr2/myWidgets/smart_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PanelDescription extends StatelessWidget {
  const PanelDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 24,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const BoldText(text: '<'),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: MainBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (int i = 1; i < 9; i++)
                      BoldText(
                        text: '$i',
                      ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

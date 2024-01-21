import 'package:butlometr2/fonts/fonts.dart';
import 'package:butlometr2/myWidgets/smart_box.dart';
import 'package:flutter/material.dart';

class ButtonWithTextAndIcon extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function()? onTap;
  const ButtonWithTextAndIcon({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: MainBox(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon),
              const SizedBox(
                width: 10.0,
              ),
              NormalText(text: text),
            ],
          ),
        )),
      ),
    );
  }
}

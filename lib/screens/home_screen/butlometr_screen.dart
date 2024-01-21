import 'package:butlometr2/fonts/fonts.dart';
import 'package:butlometr2/http/put_http.dart';
import 'package:butlometr2/myWidgets/buttons.dart';
import 'package:butlometr2/myWidgets/smart_box.dart';
import 'package:butlometr2/screens/all_boat_screen/logo/butlometr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ButlometrScreen extends StatelessWidget {
  const ButlometrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Butlometr(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  ButtonWithTextAndIcon(
                    text: 'panel lokalny',
                    icon: Icons.list_outlined,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/panelScreen',
                      );
                    },
                  ),
                  ButtonWithTextAndIcon(
                    icon: Icons.upload,
                    text: 'Prześlij dane do chmury',
                    onTap: () {
                      sendToFirebase();
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  ButtonWithTextAndIcon(
                    text: 'panel główny',
                    icon: Icons.apps_outlined,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/mainScreen',
                      );
                    },
                  ),
                  ButtonWithTextAndIcon(
                    icon: Icons.download,
                    text: 'Pobierz dane z chmury',
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

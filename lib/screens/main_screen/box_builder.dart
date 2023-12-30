import 'package:butlometr2/firebase/boat_data.dart';
import 'package:butlometr2/fonts/fonts.dart';
import 'package:butlometr2/myWidgets/boat_data_box.dart';
import 'package:butlometr2/myWidgets/smart_box.dart';
import 'package:butlometr2/screens/panel_screen/panel_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BoatDetails extends StatelessWidget {
  final String idCity;
  final String idBoat;
  final Map<String, dynamic>? panels;
  final String? timestamp;

  const BoatDetails({
    super.key,
    required this.idCity,
    required this.idBoat,
    this.panels,
    this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < 1; i++)
          BoatBox(
            idCity: idCity,
            idBoat: idBoat,
            panels: panels,
            timestamp: timestamp,
          )
      ],
    );
  }
}

class BoatBox extends StatelessWidget {
  final String? idCity;
  final String? idBoat;
  final Map<String, dynamic>? panels;
  final String? timestamp;
  final List<Map<String, bool>>? tanks;
  const BoatBox({
    super.key,
    this.idCity,
    this.idBoat,
    this.timestamp,
    this.tanks,
    this.panels,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () => Navigator.push<void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => PanelScreen(
              panels: panels,
              timestamp: timestamp,
            ),
          ),
        ),
        child: MainBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24.0,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Center(
                    child: BoatDataBox(
                      text: idCity ?? 'brak danych',
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: BoatDataBox(
                      text: idBoat ?? 'brak danych',
                    ),
                  ),
                ),
                const Expanded(
                    flex: 2,
                    child: Center(
                      child: BoldText(
                        text: '>',
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

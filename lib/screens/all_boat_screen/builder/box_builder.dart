import 'package:butlometr2/fonts/fonts.dart';
import 'package:butlometr2/myWidgets/boat_data_box.dart';
import 'package:butlometr2/myWidgets/smart_box.dart';
import 'package:butlometr2/screens/chart/chart_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BoatDetails extends StatelessWidget {
  final String idCity;
  final String idBoat;
  final Map<String, dynamic>? panels;
  final String? timestamp;
  final int? clickedBoat;

  const BoatDetails(
      {super.key,
      required this.idCity,
      required this.idBoat,
      this.panels,
      this.timestamp,
      this.clickedBoat});

  @override
  Widget build(BuildContext context) {
    return BoatBox(
      idCity: idCity,
      idBoat: idBoat,
      panels: panels,
      timestamp: timestamp,
      clickedBoat: clickedBoat,
    );
  }
}

class BoatBox extends StatefulWidget {
  final int? clickedBoat;
  final String? idCity;
  final String? idBoat;
  final Map<String, dynamic>? panels;
  final String? timestamp;
  final List<Map<String, bool>>? tanks;
  const BoatBox(
      {super.key,
      this.idCity,
      this.idBoat,
      this.timestamp,
      this.tanks,
      this.panels,
      this.clickedBoat});

  @override
  State<BoatBox> createState() => _BoatBoxState();
}

class _BoatBoxState extends State<BoatBox> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isClicked = !isClicked;
          });
        },
        child: Column(
          children: [
            MainBox(
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
                          text: widget.idCity ?? 'brak danych',
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: BoatDataBox(
                          text: widget.idBoat ?? 'brak danych',
                        ),
                      ),
                    ),
                    const Expanded(
                        flex: 2,
                        child: Center(
                          child: BoldText(
                            text: 'v',
                          ),
                        )),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: isClicked ? true : false,
              child: Column(
                children: [
                  for (int i = 0; i < widget.panels!.length; i++)
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return ChartScreen(
                                isInWaterCounter:
                                    isInWaterCounter(context, i + 1),
                              );
                            });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MainBox(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: NormalText(text: 'Panel ${i + 1}'),
                          ),
                        ),
                      ),
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<List<double>> isInWaterCounter(
      BuildContext context, int clickedPanel) async {
    List<double> logsCountList = [];
    if (widget.idBoat != null) {
      await FirebaseFirestore.instance
          .collection('boats_logs')
          .where('id_boat', isEqualTo: widget.idBoat)
          .get()
          .then((snapshot) {
        for (int tankNumber = 1; tankNumber <= 8; tankNumber++) {
          int logsCount = 0;
          for (var doc in snapshot.docs) {
            if (doc.data()['panels']['panel_$clickedPanel']['tank_$tankNumber']
                    ['isInWater'] ==
                true) {
              logsCount++;
            }
          }
          logsCountList.add(((logsCount * 5)) //jeden odczyt to 5 sekund
              .roundToDouble()); //jak ustawie /3600 to są małe części godziny
        }
        debugPrint(
            'Number of logs for ${widget.idBoat} with tank_1 to tank_8 for panel $clickedPanel isInWater = true: $logsCountList');
      });
    }
    return logsCountList;
  }
}

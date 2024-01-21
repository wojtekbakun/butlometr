import 'package:butlometr2/http/fetch_http.dart';
import 'package:butlometr2/consts/colors.dart';
import 'package:butlometr2/fonts/fonts.dart';
import 'package:butlometr2/myWidgets/smart_box.dart';
import 'package:butlometr2/screens/bottle_screen/bottle_dialog.dart';
import 'package:butlometr2/screens/panel_screen/panel_description.dart';
import 'package:flutter/material.dart';

class PanelScreen extends StatelessWidget {
  const PanelScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var panelsData = getLocalData();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const PanelDescription(),
            FutureBuilder(
              future: panelsData,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  Map<String, dynamic>? panels = snapshot.data;
                  if (panels == null) {
                    return const Text('brak danych');
                  }
                  var timestamp = panels['timestamp'];
                  return Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: panels['panels'].length,
                        itemBuilder: (BuildContext context, int index) {
                          return DetBox(
                            idPanel: panels["panels"].keys.elementAt(index)[6],
                            panels: panels["panels"],
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24.0),
                        child: NormalText(text: 'odświezono: $timestamp'),
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DetBox extends StatelessWidget {
  final String? idPanel;
  final Color? color;
  final Map<String, dynamic>? panels;

  const DetBox({
    super.key,
    this.idPanel,
    this.color,
    this.panels,
  });

  getColor(bool? isActive, bool? isInPlace, bool? isInWater) {
    final Color color = isActive ?? false
        ? isInPlace ?? false
            ? isInWater ?? false
                ? AppColors.activeColor
                : AppColors.accentColor
            : AppColors.inactiveColor
        : AppColors.darkColor;
    return color;
  }

  @override
  Widget build(BuildContext context) {
    //debugPrint('\n IDPANEL: $idPanel');
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: MainBox(
        height: 100,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: NormalText(text: idPanel ?? 'brak danych'),
              ),
            ),
            Expanded(
              flex: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (int nrTank = 1; nrTank < 9; nrTank++)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 24,
                      ),
                      child: GestureDetector(
                        onTap: () => bottleDialog(
                            context,
                            '$nrTank',
                            panels?['panel_$idPanel']?['tank_$nrTank']
                                ?['id_rfid'],
                            panels?['panel_$idPanel']?['tank_$nrTank']
                                ?['isInPlace'],
                            panels?['panel_$idPanel']?['tank_$nrTank']
                                ?['isActive'],
                            panels?['panel_$idPanel']?['tank_$nrTank']
                                ?['isInWater']),
                        child: StatusBoxDetails(
                          color: getColor(
                              panels?['panel_$idPanel']?['tank_$nrTank']
                                  ?['isActive'],
                              panels?['panel_$idPanel']?['tank_$nrTank']
                                  ?['isInPlace'],
                              panels?['panel_$idPanel']?['tank_$nrTank']
                                  ?['isInWater']),
                        ),
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

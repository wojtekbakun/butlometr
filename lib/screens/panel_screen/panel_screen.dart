import 'package:butlometr2/consts/colors.dart';
import 'package:butlometr2/fonts/fonts.dart';
import 'package:butlometr2/myWidgets/smart_box.dart';
import 'package:butlometr2/screens/bottle_screen/bottle_dialog.dart';
import 'package:butlometr2/screens/panel_screen/panel_description.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PanelScreen extends StatelessWidget {
  final Map<String, dynamic>? panels;
  final String? timestamp;

  const PanelScreen({
    super.key,
    this.panels,
    this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint('lenght: ${panels!.length}');
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const PanelDescription(),
            for (int i = 0; i < panels!.length; i++)
              DetBox(
                idPanel: panels?.keys.elementAt(i),
                panels: panels,
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: NormalText(text: 'odświezono: $timestamp'),
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
                            panels?['panel$idPanel']['butla$nrTank']
                                ?['id_rfid'],
                            panels?['panel$idPanel']['butla$nrTank']
                                ?['isInPlace'],
                            panels?['panel$idPanel']['butla$nrTank']
                                ?['isActive'],
                            panels?['panel$idPanel']['butla$nrTank']
                                ?['isInWater']),
                        child: StatusBoxDetails(
                          color: getColor(
                              panels?['panel$idPanel']['butla$nrTank']
                                  ?['isActive'],
                              panels?['panel$idPanel']['butla$nrTank']
                                  ?['isInPlace'],
                              panels?['panel$idPanel']['butla$nrTank']
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

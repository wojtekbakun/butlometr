import 'package:butlometr2/fonts/fonts.dart';
import 'package:butlometr2/myWidgets/smart_box.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

bottleDialog(
  BuildContext context,
  String? nrTank,
  String? idTank,
  bool? isInPlace,
  bool? isInWater,
  bool? isActive,
) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return DefaultTextStyle(
        style: GoogleFonts.jetBrainsMono(),
        child: Center(
          child: SizedBox(
            height: 500,
            width: 600,
            child: MainBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 28.0, top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: const Center(
                              child: NormalText(text: '<'),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Center(
                            child: NormalText(
                              text: 'Butla nr. $nrTank',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  BottleData(
                    data: 'id butli',
                    value: idTank,
                  ),
                  BottleData(
                    data: 'czy butla jest na miejscu',
                    value: isInPlace ?? false ? 'tak' : 'nie',
                  ),
                  BottleData(
                    data: 'czy butla jest w wodzie',
                    value: isInWater ?? false ? 'tak' : 'nie',
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

class BottleData extends StatelessWidget {
  final String data;
  final String? value;
  const BottleData({super.key, required this.data, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NormalText(text: '$data:  '),
          BoldText(text: value ?? 'brak danych'),
        ],
      ),
    );
  }
}

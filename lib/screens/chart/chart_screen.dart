import 'package:butlometr2/myWidgets/smart_box.dart';
import 'package:butlometr2/screens/chart/chart.dart';
import 'package:flutter/material.dart';

class ChartScreen extends StatelessWidget {
  final Future<List<double>> isInWaterCounter;
  const ChartScreen({super.key, required this.isInWaterCounter});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<double>>(
      future: isInWaterCounter,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          debugPrint('isInWaterCounter: ${snapshot.data}');
          return Center(
            child: MainBox(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: SizedBox(
                  height: 200,
                  width: 500,
                  child: ChartWidget(
                    panelData: snapshot.data!,
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

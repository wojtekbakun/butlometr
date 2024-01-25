import 'package:butlometr2/consts/colors.dart';
import 'package:butlometr2/screens/chart/bar_data.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ChartWidget extends StatelessWidget {
  final List<double> panelData;
  const ChartWidget({
    super.key,
    required this.panelData,
  });

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
      firstBottle: panelData[0],
      secondBottle: panelData[1],
      thirdBottle: panelData[2],
      fourthBottle: panelData[3],
      fifthBottle: panelData[4],
      sixthBottle: panelData[5],
      seventhBottle: panelData[6],
      eighthBottle: panelData[7],
    );
    myBarData.initializeBarData();
    double maxValue = myBarData.barData
        .map((data) => data.value)
        .reduce((a, b) => a > b ? a : b);
    return BarChart(
      BarChartData(
        maxY: maxValue,
        minY: 0,
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: const FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true, reservedSize: 24)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true, reservedSize: 40)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        barGroups: myBarData.barData
            .map((data) => BarChartGroupData(
                  x: data.xLabel,
                  barRods: [
                    BarChartRodData(
                        toY: data.value,
                        color: AppColors.activeColor,
                        width: 20,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(6),
                        ),
                        backDrawRodData: BackgroundBarChartRodData(
                          show: true,
                          toY: maxValue,
                          color: AppColors.inactiveColor,
                        )),
                  ],
                ))
            .toList(),
      ),
    );
  }
}

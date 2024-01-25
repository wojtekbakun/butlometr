import 'package:butlometr2/screens/chart/one_bar.dart';

class BarData {
  final double firstBottle;
  final double secondBottle;
  final double thirdBottle;
  final double fourthBottle;
  final double fifthBottle;
  final double sixthBottle;
  final double seventhBottle;
  final double eighthBottle;

  BarData({
    required this.firstBottle,
    required this.secondBottle,
    required this.thirdBottle,
    required this.fourthBottle,
    required this.fifthBottle,
    required this.sixthBottle,
    required this.seventhBottle,
    required this.eighthBottle,
  });

  List<OneBar> barData = [];

  void initializeBarData() {
    barData = [
      OneBar(value: firstBottle, xLabel: 1),
      OneBar(value: secondBottle, xLabel: 2),
      OneBar(value: thirdBottle, xLabel: 3),
      OneBar(value: fourthBottle, xLabel: 4),
      OneBar(value: fifthBottle, xLabel: 5),
      OneBar(value: sixthBottle, xLabel: 6),
      OneBar(value: seventhBottle, xLabel: 7),
      OneBar(value: eighthBottle, xLabel: 8),
    ];
  }
}

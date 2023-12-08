import 'package:butlometr2/boats_data.dart';
import 'package:butlometr2/consts/colors.dart';
import 'package:butlometr2/consts/dimensions.dart';
import 'package:butlometr2/myWidgets/boat_data_box.dart';
import 'package:butlometr2/myWidgets/smart_box.dart';
import 'package:flutter/material.dart';

class BoxBuilder extends StatelessWidget {
  const BoxBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(DataFromAllBoats().boats.length, (index) {
        return Padding(
          padding:
              const EdgeInsets.symmetric(vertical: BoxSizes.verticalPadding),
          child: MainBox(
            child: BoatDetails(
              boatData: DataFromAllBoats().boats[index],
            ),
          ),
        );
      }),
    );
  }
}

class BoatDetails extends StatelessWidget {
  final BoatData boatData;
  const BoatDetails({
    super.key,
    required this.boatData,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StatusBox(
          color: boatData.czyUzywana
              ? AppColors.activeColor
              : AppColors.inactiveColor,
        ),
        BoatDataBox(
          text: boatData.idLodzi,
        ),
        BoatDataBox(
          text: boatData.idButli.toString(),
        ),
        BoatDataBox(
          text: boatData.rozmiarPanelu.toString(),
        ),
        BoatDataBox(
          text: boatData.idMiejscowosci,
        ),
      ],
    );
  }
}

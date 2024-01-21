import 'package:butlometr2/consts/colors.dart';
import 'package:butlometr2/http/get_data_from_firestore.dart';
import 'package:butlometr2/screens/all_boat_screen/builder/box_builder.dart';
import 'package:butlometr2/screens/all_boat_screen/builder/main_screen_description.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const UpperDescription(),
              FutureBuilder(
                future: getDataFromFirestore(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<dynamic>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    List<dynamic>? boatData = snapshot.data;
                    debugPrint("${snapshot.data}");
                    if (boatData == null || boatData.isEmpty) {
                      return const Text('Brak danych');
                    }
                    return ListView.builder(
                      itemCount: boatData.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => BoatDetails(
                        idCity: boatData[index]["id_city"],
                        idBoat: boatData[index]["id_boat"],
                        panels: boatData[index]["panels"],
                        timestamp: boatData[index]["timestamp"],
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
    );
  }
}

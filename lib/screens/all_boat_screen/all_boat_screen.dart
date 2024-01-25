import 'package:butlometr2/consts/colors.dart';
import 'package:butlometr2/http/get_data_from_firestore.dart';
import 'package:butlometr2/screens/all_boat_screen/builder/box_builder.dart';
import 'package:butlometr2/screens/all_boat_screen/builder/main_screen_description.dart';
import 'package:flutter/material.dart';

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

                    if (boatData == null || boatData.isEmpty) {
                      return const Text('Brak danych');
                    }

                    // Create a set to keep track of unique id_boat values
                    Set<String> uniqueBoats = {};

                    // Create a list to store the filtered boat details
                    List<Widget> boatDetailsList = [];

                    // Iterate through the boatData list
                    for (int index = 0; index < boatData.length; index++) {
                      // Check if id_boat is unique, if not skip rendering
                      if (uniqueBoats.contains(boatData[index]["id_boat"])) {
                        continue; // Skip rendering
                      } else {
                        uniqueBoats.add(boatData[index]["id_boat"]);
                        boatDetailsList.add(
                          GestureDetector(
                            child: BoatDetails(
                              idCity: boatData[index]["id_city"],
                              idBoat: boatData[index]["id_boat"],
                              panels: boatData[index]["panels"],
                              timestamp: boatData[index]["timestamp"],
                              clickedBoat: index,
                            ),
                          ),
                        );
                      }
                    }

                    return ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: boatDetailsList,
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

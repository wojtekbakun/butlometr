import 'package:butlometr2/firebase/boat_data.dart';
import 'package:butlometr2/screens/main_screen/butlometr.dart';
import 'package:flutter/material.dart';

class ButlometrScreen extends StatelessWidget {
  const ButlometrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
          onTap: () async {
            BoatSingleData().boatData.getDataFromFirestore;
            Navigator.pushNamed(context, '/mainScreen');
          },
          child: const Butlometr()),
    );
  }
}

import 'package:butlometr2/butlometr_screen.dart';
import 'package:butlometr2/firebase/boat_data.dart';
import 'package:butlometr2/screens/main_screen/box_builder.dart';
import 'package:butlometr2/screens/main_screen/main_screen_description.dart';
import 'package:butlometr2/screens/panel_screen/panel_screen.dart';
import 'package:flutter/material.dart';
import 'consts/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Butlometr',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/mainScreen': (context) => const MyHomePage(),
        '/panelScreen': (context) => const PanelScreen(),
        '/butlometrScreen': (context) => const ButlometrScreen(),
      },
      initialRoute: '/butlometrScreen',
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(48.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const UpperDescription(),
            BoatDetails(
              idCity: BoatSingleData().boatData.idCity,
              idBoat: BoatSingleData().boatData.idBoat,
              panels: BoatSingleData().boatData.panels,
              timestamp: BoatSingleData().boatData.timestamp,
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
    );
  }
}

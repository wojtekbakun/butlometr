import 'package:butlometr2/screens/all_boat_screen/all_boat_screen.dart';
import 'package:butlometr2/screens/home_screen/butlometr_screen.dart';
import 'package:butlometr2/screens/panel_screen/panel_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
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
        '/mainScreen': (context) => const MainScreen(),
        '/panelScreen': (context) => const PanelScreen(),
        '/butlometrScreen': (context) => const ButlometrScreen(),
      },
      initialRoute: '/butlometrScreen',
    );
  }
}

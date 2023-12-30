import 'dart:convert' as convert;

import 'package:butlometr2/screens/main_screen/butlometr.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ButlometrScreen extends StatelessWidget {
  const ButlometrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
          onTap: () async {
            // BoatSingleData().boatData.getDataFromFirestore;
            // Navigator.pushNamed(context, '/mainScreen');

            await fetchDataHTTP();
            // debugPrint(data);
          },
          child: const Butlometr()),
    );
  }
}

fetchDataHTTP() async {
  var url = Uri.http('192.168.0.106:8000', '/');
  var response = await http.get(url);
  debugPrint('status: ${response.statusCode}');
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    debugPrint('Ottzymany json: $jsonResponse.');
  } else {
    debugPrint('Request failed with status: ${response.statusCode}.');
  }
}

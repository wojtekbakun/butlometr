import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BoatSingleData {
  BoatData boatData = BoatData();
}

class BoatData {
  // Metoda uzyskująca dostęp do obiektu singleton
  static BoatData get instance => _instance;

  static final BoatData _instance = BoatData._internal();
  factory BoatData() {
    return _instance;
  }
  BoatData._internal();
  // Dane
  String idCity = '';
  String idBoat = '';
  String timestamp = '';
  Map<String, dynamic> panels = {};

  // Metoda ustawiająca dane
  void setData(
    String idCity,
    String idBoat,
    String timestamp,
    Map<String, dynamic> panels,
  ) {
    BoatSingleData().boatData.idCity = idCity;
    BoatSingleData().boatData.idBoat = idBoat;
    BoatSingleData().boatData.timestamp = timestamp;
    BoatSingleData().boatData.panels = panels;
  }

  // Metoda pobierająca dane z Firestore
  void getDataFromFirestore() async {
    // Utworzenie obiektu FirebaseFirestore
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    // Pobranie danych z kolekcji "lodzie"
    CollectionReference collectionRef = firebaseFirestore.collection('łodzie');
    try {
      QuerySnapshot querySnapshot = await collectionRef.get();

      // Przetworzenie danych
      for (DocumentSnapshot documentSnapshot in querySnapshot.docs) {
        // Pobranie danych z dokumentu
        String idCity = documentSnapshot['id_city'];
        String idBoat = documentSnapshot['id_boat'];
        String timestamp = documentSnapshot['timestamp'];

        Map<String, dynamic> panels =
            Map<String, dynamic>.from(documentSnapshot['panels']);
        debugPrint(
            'panel 1, butl 1:- ${BoatSingleData().boatData.panels} - lenght: ${BoatSingleData().boatData.panels.length}');
        // Ustawienie danych w klasie
        setData(idCity, idBoat, timestamp, panels);
      }
    } catch (e) {
      debugPrint('error: $e');
    }
  }
}

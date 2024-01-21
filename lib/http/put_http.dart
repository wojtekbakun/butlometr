import 'package:butlometr2/http/consts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void sendToFirebase() async {
  try {
    var urlSendDataToFirebase =
        Uri.http(ConnectionSettings.hostIp, '/sendDataToFirebase');
    var urlDeleteLocalData =
        Uri.http(ConnectionSettings.hostIp, '/deleteLocalData');
    var response = await http.get(urlSendDataToFirebase);
    if (response.statusCode == 200) {
      debugPrint('Data sent to Firebase successfully');
      try {
        var response = await http.get(urlDeleteLocalData);
        if (response.statusCode == 200) {
          debugPrint('Local data deleted successfully');
        } else {
          debugPrint('Failed to delete local data');
        }
      } catch (e) {
        debugPrint('Error deleting local data: $e');
      }
      //delete all logs
    } else {
      debugPrint('Failed to send data to Firebase');
    }
  } catch (e) {
    debugPrint('Error sending data to Firebase: $e');
  }
}

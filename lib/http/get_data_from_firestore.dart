import 'dart:convert' as convert;
import 'package:butlometr2/http/consts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<dynamic>> getDataFromFirestore() async {
  var url = Uri.http(ConnectionSettings.hostIp, '/getDataFromFirebase');

  try {
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);

      // Assuming jsonResponse is a List
      if (jsonResponse is List) {
        return jsonResponse;
      } else {
        throw const FormatException('Unexpected data format');
      }
    } else {
      debugPrint('Request failed with status: ${response.statusCode}.');
      throw Exception('Failed to load data');
    }
  } catch (e) {
    debugPrint('Error: $e');
    throw Exception('Failed to load data');
  }
}

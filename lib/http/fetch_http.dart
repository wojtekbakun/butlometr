import 'dart:convert' as convert;
import 'package:butlometr2/http/consts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

getLocalData() async {
  var url = Uri.http(ConnectionSettings.hostIp, '/getLocalData');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    var id = jsonResponse;
    return id; // Return the decoded JSON
  } else {
    debugPrint('Request failed with status: ${response.statusCode}.');
  }
}

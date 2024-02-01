import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:radio_oliana/models/radio_station.dart';

Future<List<RadioStation>> getRadios() async {
  List<RadioStation> radiosStations = [];
  RadioStation radioStation;
  var url = Uri.parse(
      "http://de1.api.radio-browser.info/json/stations/bystate/barcelona");
  Response response = await http.get(url);
  var json = jsonDecode(response.body);
  for (var radio in json) {
    radioStation = RadioStation.fromMap(radio);
    if (radioStation.url.startsWith('https')) radiosStations.add(radioStation);
  }
  return radiosStations;
}

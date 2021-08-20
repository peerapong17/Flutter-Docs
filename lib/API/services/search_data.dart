import 'dart:convert';
import 'package:flutter_docs/Model/weather_model.dart';
import 'package:http/http.dart' as http;

Future<WeatherModel> searchData(String input) async {
  final apiKey = "ca0873a42d04802307eab7bfa6d10f75";
  final mainKey = "https://api.openweathermap.org/data/2.5/weather";
  http.Response response =
      await http.get(Uri.parse('$mainKey?q=$input&appid=$apiKey&units=metric'));
  Map<String, dynamic> decodedJson = json.decode(response.body);
  WeatherModel weatherModel = WeatherModel.fromJson(decodedJson);
  return weatherModel;
}

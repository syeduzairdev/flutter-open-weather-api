import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../../model/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  WeatherService._privateConstructor();
  static final WeatherService instance = WeatherService._privateConstructor();
  Future<WeatherModel> getWheather(double lat, double long) async {
    var userHeader = {"Accept": "application/json"};
    final response = await http.get(
      Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=App_Key&units=metric"),
      headers: userHeader,
    );
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      WeatherModel weatherModel = WeatherModel.fromJson(data);
      return weatherModel;
    } else {
      throw Exception('Failed to load weather');
    }
  }
}

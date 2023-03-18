import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_models/today_weather_model.dart';
import 'package:weather_app/services/geolocator_service.dart';

class WeatherService {
  static const String baseURL =
      "https://api.open-meteo.com/v1/forecast?hourly=temperature_2m,precipitation_probability,weathercode&daily=weathercode,temperature_2m_max,temperature_2m_min,precipitation_probability_max&timezone=auto&current_weather=true";

  static http.Response? response;
  static String? location;

  static Future<void> callApi() async {
    final position = await GeolocatorService.getPosition();
    location = position.name;
    final url = Uri.parse(
        "$baseURL&latitude=${position.latitude}&longitude=${position.longitude}");
    response = await http.get(url);
  }

  static Future<TodayWeatherModel> getTodaysWeather() async {
    if (response == null) {
      await callApi();
    }

    if (response!.statusCode == 200) {
      final Map<String, dynamic> weather = jsonDecode(response!.body);
      return TodayWeatherModel.fromJson(weather['current_weather'], location!);
    }
    throw Error();
  }
}

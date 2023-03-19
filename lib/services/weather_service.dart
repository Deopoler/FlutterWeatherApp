import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_models/hourly_weather_model.dart';
import 'package:weather_app/models/weather_models/today_weather_model.dart';
import 'package:weather_app/services/geolocator_service.dart';

class WeatherService {
  static const String baseURL =
      "https://api.open-meteo.com/v1/forecast?hourly=temperature_2m,precipitation_probability,weathercode&timezone=auto&current_weather=true";

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

  static Future<List<HourlyWeatherModel>> getHourlyWeather() async {
    if (response == null) {
      await callApi();
    }

    List<HourlyWeatherModel> weathers = [];

    if (response!.statusCode == 200) {
      final Map<String, dynamic> weather = jsonDecode(response!.body);
      final Map<String, dynamic> hourly = weather['hourly'];
      for (var i in List.generate(hourly['time'].length, (index) => index)) {
        if (DateTime.parse(hourly['time'][i]).compareTo(DateTime.now()) > 0) {
          weathers.add(HourlyWeatherModel(
            temperature: hourly['temperature_2m'][i],
            weathercode: hourly['weathercode'][i],
            precipitationProbability: hourly['precipitation_probability'][i],
            time: hourly['time'][i],
          ));
        }

        if (weathers.length >= 24) {
          break;
        }
      }
      return weathers;
    }
    throw Error();
  }
}

import 'package:weather_app/models/weather_models/weather_model_utils.dart';

class TodayWeatherModel {
  final double temperature;
  final int weathercode;
  late final String svg;
  final String location;

  TodayWeatherModel.fromJson(Map<String, dynamic> json, this.location)
      : temperature = json['temperature'],
        weathercode = json['weathercode'] {
    final hour = DateTime.parse(json['time']).hour;
    if (hour <= 6 || hour >= 19) {
      svg = weathercodeToNightSvg(weathercode);
    } else {
      svg = weathercodeToDaySvg(weathercode);
    }
  }
}

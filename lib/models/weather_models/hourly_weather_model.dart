import 'package:intl/intl.dart';

import 'weather_model_utils.dart';

class HourlyWeatherModel {
  final double temperature;
  final int weathercode;
  late final String svg;
  final int precipitationProbability;
  String time;

  HourlyWeatherModel({
    required this.temperature,
    required this.weathercode,
    required this.precipitationProbability,
    required this.time,
  }) {
    final hour = DateTime.parse(time).hour;
    time = DateFormat("h a").format(DateTime.parse(time));
    if (hour <= 6 || hour >= 19) {
      svg = weathercodeToNightSvg(weathercode);
    } else {
      svg = weathercodeToDaySvg(weathercode);
    }
  }
}

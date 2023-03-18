import 'package:intl/intl.dart';

class HourlyWeatherModel {
  final double temperature;
  final int weathercode;
  late final String svg;
  final double precipitationProbability;
  String time;

  HourlyWeatherModel({
    required this.temperature,
    required this.weathercode,
    required this.precipitationProbability,
    required this.time,
  }) {
    time = DateFormat.H().format(DateTime.parse(time));
  }
}

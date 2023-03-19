import 'package:geolocator/geolocator.dart';

class GeolocationModel {
  final double latitude;
  final double longitude;
  String? name;

  GeolocationModel(Position position, Map<String, dynamic> json)
      : latitude = position.latitude,
        longitude = position.longitude,
        name = json['results'][0]['city'];
}

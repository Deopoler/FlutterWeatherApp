import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class GeolocationModel {
  final double latitude;
  final double longitude;
  String? name;

  GeolocationModel(Position position, Placemark placemark)
      : latitude = position.latitude,
        longitude = position.longitude,
        name = placemark.thoroughfare {
    if (name?.isEmpty ?? true) {
      name = placemark.locality;
    }
  }
}

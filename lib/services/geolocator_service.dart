import 'dart:async';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/geolocation_model.dart';

class GeolocatorService {
  static final GeolocatorPlatform _geolocatorPlatform =
      GeolocatorPlatform.instance;

  static Future<bool> handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await _geolocatorPlatform.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }

    permission = await _geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _geolocatorPlatform.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }

  static Future<GeolocationModel> getPosition() async {
    if (!await handlePermission()) {
      Future.error("permission denied");
    }

    var currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    var placemarks = await placemarkFromCoordinates(
        currentPosition.latitude, currentPosition.longitude);
    return GeolocationModel(currentPosition, placemarks[0]);
  }
}

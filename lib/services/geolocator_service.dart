import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/geolocation_model.dart';

class GeolocatorService {
  static final GeolocatorPlatform _geolocatorPlatform =
      GeolocatorPlatform.instance;

  static const String geoCodeURL =
      "https://geocode.seonjin6804.workers.dev?lat=37.39942502642354&lon=127.27878478076991&lang=en&limit=1&format=json";

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
    final url = Uri.parse(geoCodeURL);
    final response = await http.get(url);
    final json = await jsonDecode(response.body);
    return GeolocationModel(currentPosition, json);
  }
}

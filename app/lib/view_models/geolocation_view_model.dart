import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GeolocationViewModel extends ChangeNotifier {
  double _distanceInMeters = 0;

  GeolocationViewModel() {
    _initGeolocation();
  }

  _initGeolocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    const locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 5,
    );
    Position? oldPosition;
    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position? position) async {
      if (oldPosition != null && position != null) {
        if (_distanceInMeters < 150) {
          _distanceInMeters += Geolocator.distanceBetween(
              position.latitude,
              position.longitude,
              oldPosition!.latitude,
              oldPosition!.longitude);
        } else {
          _distanceInMeters = 150;
        }
      }
      oldPosition = position;
      notifyListeners();
    });
  }

  double get distance => double.parse((_distanceInMeters).toStringAsFixed(1));

  void resetDistance() {
    _distanceInMeters = 0;
  }
}

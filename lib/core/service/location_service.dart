import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

/// OnLocationChanged is a callback function that returns the current position
typedef OnLocationChanged = Function(Position);

class LocationService {
  // Get the current location
  double _lat = 0.0;
  // Get the current location
  double _lon = 0.0;
  // Get Placemark from coordinates
  List<Placemark> _placemarks = [];

  // stream subscription to listen to location changes
  //  late StreamSubscription<Position> _positionStreamSubscription;

  // Get the current location
  Future<Map<String, int>> getLoaction() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      Exception('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      Exception(
        'Location permissions are permanently denied, we cannot request permissions.',
      );

      /// open app settings so that user changes permissions
      await Geolocator.openAppSettings();
      await Geolocator.openLocationSettings();
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // Get the latitude and longitude from the position
    _lat = position.latitude;
    // Get the latitude and longitude from the position
    _lon = position.longitude;
    // Get Placemark from coordinates
    _placemarks = await placemarkFromCoordinates(_lat, _lon);

    // Get the address from the position
    return {
      'lat': _lat.toInt(),
      'lon': _lon.toInt(),
    };
  }

  // Get locality name, administrative area name and country name from Placemark
  Map<String, String> getAddressDetails() {
    // Get the first location from the list.
    Placemark placeMark = _placemarks[0];

    // Get locality name
    String locality =
        placeMark.locality != null && placeMark.locality!.isNotEmpty
            ? '${placeMark.locality},'
            : '';

    // Get administrative area name and remove ' Province' from it
    String? administrativeArea = placeMark.administrativeArea;
    administrativeArea = administrativeArea?.replaceAll(' Province', '');

    // Get country name
    String? country = placeMark.country ?? '';

    return {
      'locality': locality,
      'administrativeArea': administrativeArea ?? '',
      'country': country,
    };
  }

  // listen To Location Changes
  listenLocationChanges(OnLocationChanged onLocationChanged) {
    // Location settings to get high accuracy location
    const LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );
    // listen to location changes
    Geolocator.getPositionStream(
      locationSettings: locationSettings,
    ).listen(
      (Position? position) async {
        if (position == null) return;

        if (kDebugMode) {
          print(
            // ignore: unnecessary_null_comparison
            position == null
                ? 'Unknown'
                : '${position.latitude}, ${position.longitude}',
          );
        }
        // Get the latitude and longitude from the position
        _lat = position.latitude;
        // Get the latitude and longitude from the position
        _lon = position.longitude;
        // Get Placemark from coordinates
        _placemarks = await placemarkFromCoordinates(_lat, _lon);
        // Get locality name, administrative area name and country name from Placemark
        onLocationChanged(position);
      },
    );
  }
}

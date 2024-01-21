import 'package:flutter/material.dart';
import 'package:weather_trackr/app/weather_trackr.dart';
import 'core/di/get_it.dart';
import 'core/routing/routing.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([initGetIt()]);
  runApp(WeatherTrackr(appRouter: AppRouter()));
}

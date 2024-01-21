import 'package:flutter/material.dart';
import 'package:weather_trackr/core/helpers/extensions.dart';
import 'package:weather_trackr/views/home/widgets/info_weather.dart';

class CardWeather extends StatelessWidget {
  const CardWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      left: 0,
      bottom: context.screenHeight(0.285),
      child: const InfoWeather(),
    );
  }
}

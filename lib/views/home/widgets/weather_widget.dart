import 'package:flutter/material.dart';
import 'widgets.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        BackgroundWeather(),
        AppBarWeather(),
        TempWeather(),
        CardWeather(),
      ],
    );
  }
}

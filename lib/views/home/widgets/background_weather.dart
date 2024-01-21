import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controller/blocs.dart';
import '../../../core/helpers/images_weather.dart';
import '../../../model/weather_response.dart';

class BackgroundWeather extends StatelessWidget {
  const BackgroundWeather({super.key});

  @override
  Widget build(BuildContext context) {
    // get current background weather
    return BlocBuilder<WeatherCubit, WeatherState>(
      buildWhen: (previous, current) =>
          current is! Refresh &&
          current is! Loading &&
          current is! Error &&
          current is! ChangedUnits,
      builder: (context, state) => state.maybeWhen(
        loading: () => _buildBackgroundWeather(null),
        success: (weather) => _buildBackgroundWeather(weather),
        orElse: () => _buildBackgroundWeather(null),
      ),
    );
  }

  _buildBackgroundWeather(WeatherResponse? weather) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            weather != null
                ? _getBackgroundWeather(weather)
                : ImagesWeather.defaultImage,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  String _getBackgroundWeather(WeatherResponse weather) {
    // get current sunset and sunrise
    final int sunset = weather.current.sunset;
    final int sunrise = weather.current.sunrise;

    // get current time
    final int currentTime = weather.current.dt;

    // check if it's daytime
    if (currentTime >= sunrise && currentTime <= sunset) {
      // use sunrise image
      return ImagesWeather.imageSunrie;
    } else if (currentTime > sunset) {
      // use night image
      return ImagesWeather.imageNight;
    } else if (currentTime < sunrise) {
      // use sunset image
      return ImagesWeather.imageSunset;
    }

    // default image
    return ImagesWeather.defaultImage;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../model/weather_response.dart';

/// A class that provides static methods to build LottieBuilder widgets representing weather icons.
class ImagesWeather {
  /// Returns a LottieBuilder widget representing the weather icon based on the provided [weather].
  ///
  /// The [weather] parameter is used to determine the appropriate Lottie animation file
  /// based on the weather icon code. If the weather icon code is not recognized, the
  /// 'clear-sky-day.json' animation file is used as a fallback.
  ///
  /// Example usage:
  /// ```dart
  /// Weather weather = Weather(icon: '01d');
  /// LottieBuilder icon = ImagesWeather.iconWeather(weather);
  /// ```
  static LottieBuilder iconWeather(Weather weather) {
    switch (weather.icon) {
      case '01d':
        return _buildLottieIcon('clear-sky-day.json');
      case '01n':
        return _buildLottieIcon('clear-sky-night.json');
      case '02d':
        return _buildLottieIcon('few-clouds-day.json');
      case '02n':
        return _buildLottieIcon('few-clouds-night.json');
      case '03d':
      case '03n':
        return _buildLottieIcon('scattered-clouds.json');
      case '04d':
      case '04n':
        return _buildLottieIcon('broken-clouds.json');
      case '09d':
      case '09n':
        return _buildLottieIcon('shower-rain.json');
      case '10d':
        return _buildLottieIcon('rain-day.json');
      case '10n':
        return _buildLottieIcon('rain-night.json');
      case '11d':
      case '11n':
        return _buildLottieIcon('thunderstorm.json');
      case '13d':
      case '13n':
        return _buildLottieIcon('snow.json');
      case '50d':
      case '50n':
        return _buildLottieIcon('mist.json');
      default:
        return _buildLottieIcon('clear-sky-day.json');
    }
  }

  /// Builds a LottieBuilder widget with the specified [iconPath].
  ///
  /// The [iconPath] parameter is the path to the Lottie animation file.
  /// The returned LottieBuilder widget has a width of 48.w and a height of 48.h.
  /// The filter quality is set to FilterQuality.high and the fit is set to BoxFit.cover.
  ///
  /// Example usage:
  /// ```dart
  /// LottieBuilder icon = _buildLottieIcon('clear-sky-day.json');
  /// ```
  static LottieBuilder _buildLottieIcon(String iconPath) {
    return Lottie.asset(
      'assets/lottie/$iconPath',
      width: 42.w,
      height: 42.h,
      filterQuality: FilterQuality.high,
      fit: BoxFit.cover,
    );
  }

  /// Returns the path to the background image based on the provided [weather].
  //images background weather default
  static const defaultImage = 'assets/images/sun.png';
  //images background weather in Sunrie
  static const imageSunrie = 'assets/images/sun.png';
  //images background weather in Sunset
  static const imageSunset = 'assets/images/moon.png';
  //images background weather in night
  static const imageNight = 'assets/images/blood.png';
}

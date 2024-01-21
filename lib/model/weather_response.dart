import 'package:json_annotation/json_annotation.dart';

part 'weather_response.g.dart';

/// Represents the weather response data.
@JsonSerializable()
class WeatherResponse {
  final double lat;
  final double lon;
  final String timezone;
  @JsonKey(name: 'timezone_offset')
  final int timezoneOffset;
  final Current current;
  final List<Daily> daily;

  WeatherResponse({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    required this.daily,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);
}

/// Represents the current weather data.
@JsonSerializable()
class Current {
  final int dt;
  final int sunrise;
  final int sunset;
  final double temp;
  @JsonKey(name: 'feels_like')
  final double feelsLike;
  final int pressure;
  final int humidity;
  @JsonKey(name: 'dew_point')
  final double? dewPoint;
  final num uvi;
  final int clouds;
  final int? visibility;
  @JsonKey(name: 'wind_speed')
  final double? windSpeed;
  @JsonKey(name: 'wind_deg')
  final int? windDeg;
  @JsonKey(name: 'wind_gust')
  final double? windGust;
  final List<Weather> weather;
  final Rain? rain; // this should not be in the json response
  final Sow? snow; // this should not be in the json response

  Current({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.rain,
    required this.snow,
  });

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);
}

/// Represents the daily weather data.
@JsonSerializable()
class Daily {
  final int dt;
  final int sunrise;
  final int sunset;
  final int moonrise;
  final int moonset;
  @JsonKey(name: 'moon_phase')
  final double moonPhase;
  final Temp temp;
  @JsonKey(name: 'feels_like')
  final FeelsLike feelsLike;
  final int pressure;
  final int humidity;
  @JsonKey(name: 'dew_point')
  final double? dewPoint;
  @JsonKey(name: 'wind_speed')
  final double? windSpeed;
  @JsonKey(name: 'wind_deg')
  final int? windDeg;
  @JsonKey(name: 'wind_gust')
  final double? windGust;
  final List<Weather> weather;
  final int clouds;
  final double pop;
  final double? snow; // this should not be in the json response
  final double? rain; // this should not be in the json response
  final num uvi;

  Daily({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.clouds,
    required this.pop,
    required this.rain,
    required this.snow,
    required this.uvi,
  });

  factory Daily.fromJson(Map<String, dynamic> json) => _$DailyFromJson(json);
}

// snow
@JsonSerializable()
class Sow {
  final double? snow;

  Sow({
    required this.snow,
  });

  factory Sow.fromJson(Map<String, dynamic> json) => _$SowFromJson(json);
}

/// Represents the weather data.
@JsonSerializable()
class Weather {
  final int id;
  final String main;
  final String description;
  final String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}

// rain
@JsonSerializable()
class Rain {
  final double? rain;

  Rain({
    required this.rain,
  });

  factory Rain.fromJson(Map<String, dynamic> json) => _$RainFromJson(json);
}

/// Represents the feels-like temperature data.
@JsonSerializable()
class FeelsLike {
  final double day;
  final double night;
  final double eve;
  final double morn;

  FeelsLike({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  });

  factory FeelsLike.fromJson(Map<String, dynamic> json) =>
      _$FeelsLikeFromJson(json);
}

/// Represents the temperature data.
@JsonSerializable()
class Temp {
  final double day;
  final double min;
  final double max;
  final double night;
  final double eve;
  final double morn;

  Temp({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  factory Temp.fromJson(Map<String, dynamic> json) => _$TempFromJson(json);
}

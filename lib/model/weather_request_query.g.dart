// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_request_query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherRequestQuery _$WeatherRequestQueryFromJson(Map<String, dynamic> json) =>
    WeatherRequestQuery(
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      exclude: json['exclude'] as String,
      apiKey: json['appid'] as String,
      units: json['units'] as String,
    );

Map<String, dynamic> _$WeatherRequestQueryToJson(
        WeatherRequestQuery instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
      'exclude': instance.exclude,
      'appid': instance.apiKey,
      'units': instance.units,
    };

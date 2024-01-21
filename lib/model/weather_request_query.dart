import 'package:json_annotation/json_annotation.dart';

part 'weather_request_query.g.dart';

/// Represents a query for requesting weather information.
@JsonSerializable()
class WeatherRequestQuery {
  final double lat;
  final double lon;
  final String exclude;
  @JsonKey(name: 'appid')
  final String apiKey;
  final String units;

  /// Constructs a [WeatherRequestQuery] with the specified parameters.
  WeatherRequestQuery({
    required this.lat,
    required this.lon,
    required this.exclude,
    required this.apiKey,
    required this.units,
  });

  /// Constructs a [WeatherRequestQuery] object from a JSON map.
  factory WeatherRequestQuery.fromJson(Map<String, dynamic> json) =>
      _$WeatherRequestQueryFromJson(json);

  /// Converts this [WeatherRequestQuery] object to a JSON map.
  Map<String, dynamic> toJson() => _$WeatherRequestQueryToJson(this);
}

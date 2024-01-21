import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';

/// Represents an API error response model.
@JsonSerializable()
class ApiErrorModel {
  /// The status code of the API error.
  @JsonKey(name: 'cod')
  final String statusCode;

  /// The error message.
  final String message;

  /// Creates a new instance of [ApiErrorModel].
  ///
  /// [statusCode] is the status code of the API error.
  /// [message] is the error message.
  ApiErrorModel({required this.statusCode, required this.message});

  /// Creates a new instance of [ApiErrorModel] from a JSON map.
  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);
}

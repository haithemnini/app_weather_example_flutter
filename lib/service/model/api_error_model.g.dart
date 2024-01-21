// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiErrorModel _$ApiErrorModelFromJson(Map<String, dynamic> json) =>
    ApiErrorModel(
      statusCode: json['cod'] as String,
      message: json['message'] as String,
    );

// ignore: unused_element
Map<String, dynamic> _$ApiErrorModelToJson(ApiErrorModel instance) =>
    <String, dynamic>{
      'cod': instance.statusCode,
      'message': instance.message,
    };

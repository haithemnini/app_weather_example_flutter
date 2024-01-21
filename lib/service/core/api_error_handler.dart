import 'package:dio/dio.dart';

import '../model/api_error_model.dart';
import 'api_constants.dart';

// Enum to represent different data states
enum DataSource {
  noContent,
  badRequest,
  forbidden,
  unauthorized,
  notFound,
  internalServerError,
  connectTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  defaultError,
}

// Constants for response codes
class ResponseCode {
  static const int success = 200;
  static const int noContent = 201;
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int internalServerError = 500;
  static const int notFound = 404;
  static const int apiLogicError = 422;

  static const int connectTimeout = -1;
  static const int cancel = -2;
  static const int receiveTimeout = -3;
  static const int sendTimeout = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int defaultError = -7;
}

// Constants for response messages
class ResponseMessage {
  static const String noContent = ApiErrors.noContent;
  static const String badRequest = ApiErrors.badRequestError;
  static const String unauthorized = ApiErrors.unauthorizedError;
  static const String forbidden = ApiErrors.forbiddenError;
  static const String internalServerError = ApiErrors.internalServerError;
  static const String notFound = ApiErrors.notFoundError;

  static const String connectTimeout = ApiErrors.timeoutError;
  static const String cancel = ApiErrors.defaultError;
  static const String receiveTimeout = ApiErrors.timeoutError;
  static const String sendTimeout = ApiErrors.timeoutError;
  static const String cacheError = ApiErrors.cacheError;
  static const String noInternetConnection = ApiErrors.noInternetError;
  static const String defaultError = ApiErrors.defaultError;
}

// Extension to Enum to add a function for getting ApiError model
extension DataSourceExtension on DataSource {
  ApiErrorModel getFailure() {
    switch (this) {
      case DataSource.noContent:
        return ApiErrorModel(
          statusCode: ResponseCode.noContent.toString(),
          message: ResponseMessage.noContent,
        );
      case DataSource.badRequest:
        return ApiErrorModel(
          statusCode: ResponseCode.badRequest.toString(),
          message: ResponseMessage.badRequest,
        );
      case DataSource.forbidden:
        return ApiErrorModel(
          statusCode: ResponseCode.forbidden.toString(),
          message: ResponseMessage.forbidden,
        );
      case DataSource.unauthorized:
        return ApiErrorModel(
          statusCode: ResponseCode.unauthorized.toString(),
          message: ResponseMessage.unauthorized,
        );
      case DataSource.notFound:
        return ApiErrorModel(
          statusCode: ResponseCode.notFound.toString(),
          message: ResponseMessage.notFound,
        );
      case DataSource.internalServerError:
        return ApiErrorModel(
          statusCode: ResponseCode.internalServerError.toString(),
          message: ResponseMessage.internalServerError,
        );
      case DataSource.connectTimeout:
        return ApiErrorModel(
          statusCode: ResponseCode.connectTimeout.toString(),
          message: ResponseMessage.connectTimeout,
        );
      case DataSource.cancel:
        return ApiErrorModel(
          statusCode: ResponseCode.cancel.toString(),
          message: ResponseMessage.cancel,
        );
      case DataSource.receiveTimeout:
        return ApiErrorModel(
          statusCode: ResponseCode.receiveTimeout.toString(),
          message: ResponseMessage.receiveTimeout,
        );
      case DataSource.sendTimeout:
        return ApiErrorModel(
          statusCode: ResponseCode.sendTimeout.toString(),
          message: ResponseMessage.sendTimeout,
        );
      case DataSource.cacheError:
        return ApiErrorModel(
          statusCode: ResponseCode.cacheError.toString(),
          message: ResponseMessage.cacheError,
        );
      case DataSource.noInternetConnection:
        return ApiErrorModel(
          statusCode: ResponseCode.noInternetConnection.toString(),
          message: ResponseMessage.noInternetConnection,
        );
      case DataSource.defaultError:
        return ApiErrorModel(
          statusCode: ResponseCode.defaultError.toString(),
          message: ResponseMessage.defaultError,
        );
    }
  }
}

// Class for handling errors and reconstructing the ApiError model based on DioException
class ErrorHandler implements Exception {
  late ApiErrorModel apiErrorModel;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      apiErrorModel = _handleError(error);
    } else {
      apiErrorModel = DataSource.defaultError.getFailure();
    }
  }
}

// Function to handle DioException and return ApiError model
ApiErrorModel _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.connectTimeout.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.sendTimeout.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.receiveTimeout.getFailure();
    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return ApiErrorModel.fromJson(error.response!.data);
      } else {
        return DataSource.defaultError.getFailure();
      }
    case DioExceptionType.unknown:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return ApiErrorModel.fromJson(error.response!.data);
      } else {
        return DataSource.defaultError.getFailure();
      }
    case DioExceptionType.cancel:
      return DataSource.cancel.getFailure();
    case DioExceptionType.connectionError:
    case DioExceptionType.badCertificate:
      return DataSource.defaultError.getFailure();
  }
}

// Constants for internal success and failure status within the application
class ApiInternalStatus {
  static const int success = 0;
  static const int failure = 1;
}

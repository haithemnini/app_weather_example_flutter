import 'package:dio/dio.dart';
import 'package:weather_trackr/service/core/api_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// A singleton class that provides a Dio client for making HTTP requests.
///
/// The [DioClient] class is responsible for creating and configuring a [Dio] instance
/// with the necessary options such as base URL, timeouts, and interceptors.
///
/// Example usage:
/// ```dart
/// Dio dio = DioClient.dio;
/// Response response = await dio.get('/api/data');
/// ```
class DioClient {
  DioClient._();

  static Dio? _dio;

  /// Returns the singleton instance of [Dio] client.
  ///
  /// The [dio] getter initializes a new [Dio] instance if it is null,
  /// configures it with the base URL and timeouts, and returns the instance.
  /// If the instance already exists, it simply returns the existing instance.
  static Dio get dio {
    Duration timeOut = const Duration(seconds: 30);

    if (_dio == null) {
      _dio = Dio();
      _dio!
        ..options.baseUrl = ApiConstants.apiBaseUrl
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioInterceptor();

      return _dio!;
    } else {
      return _dio!;
    }
  }

  /// Adds a [PrettyDioLogger] interceptor to the [Dio] client.
  ///
  /// The [addDioInterceptor] method adds a [PrettyDioLogger] interceptor
  /// to the [Dio] client's interceptors list. This interceptor logs detailed
  /// information about the HTTP requests and responses.
  static void addDioInterceptor() {
    _dio!.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }
}

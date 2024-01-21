import '../../model/weather_request_query.dart';
import '../../model/weather_response.dart';
import '../core/api_result.dart';

/// An abstract class representing a weather repository.
///
/// WeatherRepository provides methods to fetch weather data.
abstract class WeatherRepository {
  /// Fetches weather data based on the provided [weatherRequestQuery].
  ///
  /// Returns a [Future] that completes with an [ApiResult] containing a [WeatherResponse].
  Future<ApiResult<WeatherResponse>> getWeather(
    WeatherRequestQuery weatherRequestQuery,
  );
}

// Path: lib/service/repository/weather_repository_imp.dart
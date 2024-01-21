import '../../model/weather_request_query.dart';
import '../../model/weather_response.dart';
import '../core/api_error_handler.dart';
import '../core/api_result.dart';
import '../core/api_service.dart';
import 'weather_repository.dart';

/// A concrete implementation of the [WeatherRepository] interface.
/// This repository is responsible for fetching weather data from an API.
class WeatherRepositoryImp implements WeatherRepository {
  final ApiService _apiService;

  WeatherRepositoryImp(this._apiService);

  @override
  Future<ApiResult<WeatherResponse>> getWeather(
    WeatherRequestQuery weatherRequestQuery,
  ) async {
    try {
      final WeatherResponse response = await _apiService.getWeather(
        weatherRequestQuery.lat,
        weatherRequestQuery.lon,
        weatherRequestQuery.exclude,
        weatherRequestQuery.apiKey,
        weatherRequestQuery.units,
      );

      return ApiResult.success(response);
    } catch (error) {
      // print('error: $error');
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}

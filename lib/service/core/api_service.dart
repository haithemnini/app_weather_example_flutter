import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_trackr/service/core/api_constants.dart';

import '../../model/weather_response.dart';

part 'api_service.g.dart';

/// An abstract class representing an API service for fetching weather data.
///
/// This class is responsible for making HTTP requests to the weather API
/// and returning the weather response.
///
/// The [ApiService] class is annotated with the `@RestApi` annotation
/// from the `retrofit` package, specifying the base URL for the API.
///
/// The [getWeather] method is used to fetch weather data for a specific
/// latitude and longitude. It takes the following parameters:
///   - [lat]: The latitude of the location.
///   - [lon]: The longitude of the location.
///   - [exclude]: A comma-separated list of data blocks to exclude from the response.
///   - [apiKey]: The API key for accessing the weather API.
///   - [units]: The units of measurement for the weather data.
///
/// The method returns a [Future] that resolves to a [WeatherResponse] object,
/// which represents the weather data for the specified location.
///
/// Example usage:
/// ```dart
/// ApiService apiService = ApiService(dio);
/// WeatherResponse weather = await apiService.getWeather(
///   37.7749, -122.4194, "minutely,hourly", "YOUR_API_KEY", "metric");
/// print(weather.temperature);
/// ```
@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("onecall")
  Future<WeatherResponse> getWeather(
    @Query("lat") double lat,
    @Query("lon") double lon,
    @Query("exclude") String exclude,
    @Query("appid") String apiKey,
    @Query("units") String units,
  );
}

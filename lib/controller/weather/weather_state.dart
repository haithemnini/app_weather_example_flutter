part of 'weather_cubit.dart';

/// Represents the state of the weather in the weather app.
/// This class is used to define different states that the weather can be in.
@freezed
class WeatherState with _$WeatherState {
  /// Represents the initial state of the weather.
  const factory WeatherState.initial() = _Initial;

  /// Represents the state when the weather data is being loaded.
  const factory WeatherState.loading() = Loading;

  /// Represents the state when the weather data is being refreshed.
  const factory WeatherState.refresh() = Refresh;

  /// Represents the state when the weather data is successfully fetched.
  /// Contains the [WeatherResponse] object with the fetched weather data.
  const factory WeatherState.success(WeatherResponse weather) = Success;

  /// Represents the state when an error occurs while fetching the weather data.
  /// Contains the error message describing the error.
  const factory WeatherState.error(String errorMessage) = Error;

  /// Represents the state when the units for displaying the weather are changed.
  /// Contains the new units value.
  const factory WeatherState.changedUnits(int units) = ChangedUnits;
}

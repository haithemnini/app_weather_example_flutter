import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core/service/checker_internet.dart';
import '../../core/service/location_service.dart';
import '../../model/weather_request_query.dart';
import '../../model/weather_response.dart';
import '../../service/core/api_constants.dart';
import '../../service/core/api_result.dart';
import '../../service/repository/weather_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'weather_cubit.freezed.dart';
part 'weather_state.dart';

/// This class represents the Weather Cubit, which is responsible for managing the state and business logic related to weather data.
/// It extends the Cubit class from the flutter_bloc package.
/// The WeatherCubit requires instances of WeatherRepository, LocationService, SharedPreferences, and CheckerInternet to be passed in its constructor.
/// It emits different WeatherState objects to notify the UI about the current state of the weather data.
class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _weatherRepository;
  final LocationService _locationService;
  final SharedPreferences _sharedPreferences;
  final CheckerInternet _checkerService;

  WeatherCubit(
    this._weatherRepository,
    this._locationService,
    this._checkerService,
    this._sharedPreferences,
  ) : super(const WeatherState.initial());

  /// Fetches weather data from the API.
  /// Calls the private method `_handleWeatherRequest()` to handle the weather request.
  void fetchWeather() {
    emit(const WeatherState.loading());
    _handleWeatherRequest();
  }

  /// Refreshes weather data from the API.
  /// Emits a `WeatherState.refresh()` state to notify the UI about the refresh.
  /// Calls the private method `_handleWeatherRequest()` to handle the weather request.
  void refreshWeather() {
    emit(const WeatherState.refresh());
    _handleWeatherRequest();
  }

  /// Retrieves the current address details from the location service.
  /// Returns a string containing the locality and administrative area.
  String getAddressDetails() {
    final currentLocation = _locationService.getAddressDetails();
    return '${currentLocation['locality']} ${currentLocation['administrativeArea']}';
  }

  /// Retrieves the units from the shared preferences.
  /// Emits a `WeatherState.changedUnits()` state with the retrieved units index.
  void getUnits() {
    final int unitsIndex = _sharedPreferences.getInt('UNITS') ?? 0;
    emit(WeatherState.changedUnits(unitsIndex));
  }

  /// Listens to location changes using the location service.
  /// Emits a `WeatherState.refresh()` state to notify the UI about the refresh.
  /// Calls the private method `_weatherQuery()` to handle the weather query.
  void listenLocationChanges() {
    _locationService.listenLocationChanges((position) {
      emit(const WeatherState.refresh());
      _weatherQuery(position.latitude, position.longitude);
    });
  }

  /// Checks if there is an internet connection using the checker service.
  /// Returns a Future<bool> indicating whether there is an internet connection or not.
  Future<bool> _checkInternetConnection() async {
    return await _checkerService.checkInternetConnection();
  }

  /// Listens to internet changes using the checker service.
  /// If there is an internet connection, emits a `WeatherState.refresh()` state to notify the UI about the refresh.
  /// Calls the private method `_handleWeatherRequest()` to handle the weather request.
  /// If there is no internet connection, emits a `WeatherState.error()` state with the message "No Internet Connection".
  void listenInternetChanges() {
    _checkerService.listenInternetChanges((isConnected) {
      if (isConnected) {
        emit(const WeatherState.refresh());
        _handleWeatherRequest();
      } else {
        emit(const WeatherState.error('No Internet Connection'));
      }
    });
  }

  /// Changes the units in the shared preferences.
  /// Sets the units index in the shared preferences.
  /// Emits a `WeatherState.changedUnits()` state with the new units index.
  /// Calls the private method `_handleWeatherRequest()` to handle the weather request.
  void changeUnits(int units) {
    _sharedPreferences.setInt('UNITS', units);
    emit(WeatherState.changedUnits(units));
    _handleWeatherRequest();
  }

  /// Handles the weather request by checking the internet connection and getting the current location.
  /// If there is no internet connection, emits a `WeatherState.error()` state with the message "No Internet Connection".
  /// Otherwise, calls the private method `_weatherQuery()` to query the weather data using the current location.
  void _handleWeatherRequest() async {
    try {
      // Checks if there is an internet connection.
      final bool isConnected = await _checkInternetConnection();
      if (!isConnected) {
        emit(const WeatherState.error('No Internet Connection'));
        return;
      }

      final currentLocation = await _locationService.getLoaction();
      _weatherQuery(
        currentLocation['lat']!.toDouble(),
        currentLocation['lon']!.toDouble(),
      );
    } catch (error) {
      emit(WeatherState.error(error.toString()));
    }
  }

  /// Queries the weather data from the API using the provided latitude and longitude.
  /// If there is no internet connection, emits a `WeatherState.error()` state with the message "No Internet Connection".
  /// Otherwise, calls the `getWeather()` method of the weather repository to fetch the weather data.
  /// Emits a `WeatherState.success()` state with the fetched weather data if the API call is successful.
  /// Emits a `WeatherState.error()` state with the error message if the API call fails.
  void _weatherQuery(double lat, double lon) async {
    final bool isConnected = await _checkInternetConnection();
    if (!isConnected) {
      emit(const WeatherState.error('No Internet Connection'));
      return;
    }

    await _weatherRepository
        .getWeather(WeatherRequestQuery(
      lat: lat,
      lon: lon,
      exclude: ApiConstants.defaultExclude,
      apiKey: ApiConstants.apiKey,
      units: _units(),
    ))
        .then(
      (ApiResult<WeatherResponse> result) {
        result.when(
          success: (weather) => emit(WeatherState.success(weather)),
          failure: (error) => emit(
            WeatherState.error(error.apiErrorModel.message),
          ),
        );
      },
    ).catchError(
      (error) {
        emit(WeatherState.error(error.toString()));
      },
    );
  }

  /// Retrieves the units from the shared preferences.
  /// Returns the units string based on the retrieved units index.
  String _units() {
    final int unitsIndex = _sharedPreferences.getInt('UNITS') ?? 0;
    return unitsIndex == 0 ? 'metric' : 'imperial';
  }
}

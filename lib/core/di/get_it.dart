import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/blocs.dart';
import '../../service/core/api_service.dart';
import '../../service/core/dio_client.dart';
import '../../service/repository/weather_repository.dart';
import '../../service/repository/weather_repository_imp.dart';
import '../service/checker_internet.dart';
import '../service/location_service.dart';

final getIt = GetIt.I;

/// Initializes the dependency injection container [getIt] with the necessary dependencies for the weather app.
/// This method registers the following singletons and factories:
/// - [ApiService]: A lazy singleton that provides an instance of the ApiService class, which uses the Dio client for API requests.
/// - [WeatherRepository]: A lazy singleton that provides an instance of the WeatherRepositoryImp class, which depends on [getIt].
/// - [SharedPreferences]: A lazy singleton that provides an instance of the SharedPreferences class.
/// - [LocationService]: A lazy singleton that provides an instance of the LocationService class.
/// - [CheckerInternet]: A lazy singleton that provides an instance of the CheckerInternet class.
/// - [WeatherCubit]: A factory that provides an instance of the WeatherCubit class, which depends on [getIt] for ApiService, WeatherRepository, SharedPreferences, and LocationService instances.
/// - [ThemesCubit]: A factory that provides an instance of the ThemesCubit class, which depends on [getIt] for SharedPreferences instance.
Future<void> initGetIt() async {
  // Dio client & ApiService
  Dio dio = DioClient.dio;
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  //weather repository
  getIt.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImp(getIt()),
  );

  //sharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);

  //location
  getIt.registerLazySingleton<LocationService>(() => LocationService());

  //checker service
  getIt.registerLazySingleton<CheckerInternet>(() => CheckerInternet());

  //weather cubit
  getIt.registerFactory<WeatherCubit>(
    () => WeatherCubit(getIt(), getIt(), getIt(), getIt()),
  );

  //theme cubit
  getIt.registerFactory<ThemesCubit>(() => ThemesCubit(getIt()));
}

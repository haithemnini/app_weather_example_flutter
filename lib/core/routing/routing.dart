// ignore_for_file: unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_trackr/controller/blocs.dart';
import 'package:weather_trackr/core/di/get_it.dart';
import 'package:weather_trackr/views/home/home_view.dart';
import 'package:weather_trackr/views/settings/settings_view.dart';

import '../../views/details_settings/details_settings_view.dart';
import '../helpers/enum.dart';

@immutable
class Routes {
  /// Defines the routes used in the application.

  /// The home route.
  /// This route is used to navigate to the home view.
  static const String home = '/';

  /// The settings route.
  /// This route is used to navigate to the settings view.
  static const String settings = '/settings';

  /// The DetailsSettings route.
  /// This route is used to navigate to the DetailsSettings view.
  static const String detailsSettings = '/detailsSettings';
}

/// A class that handles the routing logic for the app.
@immutable
class AppRouter {
  /// Generates a route based on the provided [settings].
  ///
  /// The [settings] parameter contains information about the requested route,
  /// such as the route name and any arguments that were passed.
  ///
  /// Returns a [Route] object that represents the requested route.
  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.home:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<WeatherCubit>(),
            child: const HomeView(),
          ),
        );
      case Routes.settings:
        return CupertinoPageRoute(
          builder: (_) => const SettingsView(),
        );

      case Routes.detailsSettings:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<WeatherCubit>(),
            child: DetailsSettingsView(
              configSettings: arguments as ConfigSettings,
            ),
          ),
        );

      default:
        return CupertinoPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

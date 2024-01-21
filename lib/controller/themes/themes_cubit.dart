import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'themes_state.dart';
part 'themes_cubit.freezed.dart';

/// A Cubit that manages the themes for the Weather App.
///
/// This Cubit is responsible for handling the current theme mode and
/// changing the theme mode based on user preferences. It uses the
/// [SharedPreferences] to cache and retrieve the theme mode.
class ThemesCubit extends Cubit<ThemesState> {
  final SharedPreferences sharedPreferences;

  ThemesCubit(this.sharedPreferences) : super(const ThemesState.initial());

  /// Retrieves the current theme mode from the cache and emits a
  /// [ThemesState.loaded] state with the retrieved theme mode.
  void getCurrentThemeMode() async {
    final ThemeMode themeMode = await _getCachedThemeMode();
    emit(ThemesState.loaded(themeMode));
  }

  /// Changes the theme mode based on the provided [isDarkTheme] value.
  /// Emits a [ThemesState.loaded] state with the new theme mode and
  /// caches the updated theme mode using the [SharedPreferences].
  void themesChanged(bool isDarkTheme) async {
    final ThemeMode themeMode = isDarkTheme ? ThemeMode.dark : ThemeMode.light;
    emit(ThemesState.loaded(themeMode));
    await _cacheThemeMode(themeMode);
  }

  /// Retrieves the cached theme mode from the [SharedPreferences].
  ///
  /// If the cached theme mode index is valid, it returns the corresponding
  /// [ThemeMode] value. Otherwise, it returns [ThemeMode.dark] as the default.
  Future<ThemeMode> _getCachedThemeMode() async {
    final int? cachedThemeModeIndex = sharedPreferences.getInt("Themes_");

    if (cachedThemeModeIndex != null &&
        cachedThemeModeIndex < ThemeMode.values.length) {
      return ThemeMode.values[cachedThemeModeIndex];
    } else {
      return ThemeMode.dark;
    }
  }

  /// Caches the provided [themeMode] in the [SharedPreferences].
  ///
  /// The theme mode is stored as an integer index in the preferences.
  _cacheThemeMode(ThemeMode themeMode) async {
    await sharedPreferences.setInt("Themes_", themeMode.index);
  }
}

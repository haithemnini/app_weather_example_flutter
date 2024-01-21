part of 'themes_cubit.dart';

/// Represents the state of the themes in the weather app.
@freezed
class ThemesState with _$ThemesState {
  /// Represents the initial state of the themes.
  const factory ThemesState.initial() = _Initial;

  /// Represents the state when the themes are loaded.
  ///
  /// [themeMode] represents the current theme mode.
  const factory ThemesState.loaded(ThemeMode themeMode) = _Loaded;
}

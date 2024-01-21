import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import 'system_ui_overlay_config.dart';

/// Extension on [BuildContext] build context to provide easy access Context Extension.
extension ContextExtension on BuildContext {
  /// Returns the current [ThemeData] of the [BuildContext].
  ThemeData get _theme => Theme.of(this);

  /// Sets the system UI overlay based on the current [BuildContext].
  void systemUiOverlay() => SystemUiOverlayConfig.systemUiOverlay(this);

  /// Calculates the screen height based on the current [BuildContext] and a given value.
  double screenHeight(double value) => ScreenUtil().screenHeight * value;

  /// Calculates the screen width based on the current [BuildContext] and a given value.
  double screenWidth(double value) => ScreenUtil().screenWidth * value;

  /// Returns the [TextTheme] of the current [BuildContext]'s theme.
  TextTheme get textTheme => _theme.textTheme;

  /// Returns the [ColorScheme] of the current [BuildContext]'s theme.
  ColorScheme get colorScheme => _theme.colorScheme;

  /// Returns the size of the current [BuildContext]'s device.
  Size get deviceSize => MediaQuery.sizeOf(this);

  /// Returns the width of the current [BuildContext]'s device.
  double get deviceWidth => deviceSize.width;

  /// Returns the height of the current [BuildContext]'s device.
  bool isDarkTheme() => _theme.brightness == Brightness.dark;

  /// Pops the current screen from the navigation stack.
  void pop() => Navigator.pop(this);

  /// Pushes a named route onto the navigation stack.
  void pushNamed(String routeName, {Object? arguments}) =>
      Navigator.pushNamed(this, routeName, arguments: arguments);

  /// Replaces the current screen with a named route on the navigation stack.
  void pushReplacementNamed(String routeName, {Object? arguments}) =>
      Navigator.pushReplacementNamed(this, routeName, arguments: arguments);

  /// Pushes a named route onto the navigation stack and removes all previous routes.
  void pushNamedAndRemoveUntil(String routeName, {Object? arguments}) =>
      Navigator.pushNamedAndRemoveUntil(
          this, routeName, (Route<dynamic> route) => false,
          arguments: arguments);

  /// Shows a snackbar with the given message and optional color.
  void showSnackBar(String message, [Color? color]) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color ?? colorScheme.primary,
        duration: const Duration(seconds: 5),
      ),
    );
  }

  // Shows a toast with the given message and optional color.
  void showToastMsg(String message) {
    showToast(
      message,
      context: this,
      animation: StyledToastAnimation.fade,
      position: const StyledToastPosition(
        align: Alignment.bottomCenter,
        offset: 95.0,
      ),
      reverseAnimation: StyledToastAnimation.fade,
      borderRadius: BorderRadius.all(Radius.circular(32.0.w)),
      textStyle: TextStyle(color: Colors.white, fontSize: 12.sp),
    );
  }
}

/// Extension on [String] to convert the string to a double value.
/// Returns a double value of the string.
/// Throws a [FormatException] if the string is not a valid double.
/// Example: "1.0".toDouble() returns 1.0
/// Example: "1".toDouble() returns 1.0
/// Example: "1.0.0".toDouble() throws a FormatException
extension DateConversion on int {
  /// Converts the integer value to a formatted time string.
  ///
  /// Returns a string representation of the time in the format "hh:mm a".
  String convertToTime() {
    initializeDateFormatting('en', null);
    return DateFormat('hh:mm a', 'En-IN')
        .format(DateTime.fromMillisecondsSinceEpoch(this * 1000));
  }

  /// Converts the integer value to a formatted week day string.
  ///
  /// Returns a string representation of the week day in the format "EEEE".
  String convertToWeekDay() {
    initializeDateFormatting('en', null);
    return DateFormat.EEEE('en-IN')
        .format(DateTime.fromMillisecondsSinceEpoch(this * 1000));
  }

  /// Converts the integer value to a formatted day to Today string.
  ///
  /// Returns a string representation of the day to Today in the format "MMMEd".
  String convertToDayToday() {
    initializeDateFormatting('en', null);
    return DateFormat.MMMEd('en-IN')
        .format(DateTime.fromMillisecondsSinceEpoch(this * 1000));
  }
}

/// Extension on [String] to convert the string to a double value.
/// Returns a double value of the string.
/// Throws a [FormatException] if the string is not a valid double.
/// Example: "1.0".toDouble() returns 1.0
/// Example: "1".toDouble() returns 1.0
/// Example: "1.0.0".toDouble() throws a FormatException
extension ListImagesConversion on List<String> {
  String random() {
    final random = Random();
    return this[random.nextInt(length)];
  }
}

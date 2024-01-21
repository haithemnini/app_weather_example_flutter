import 'package:connectivity_plus/connectivity_plus.dart';

/// A class that provides methods to check internet connectivity.
class CheckerInternet {
  /// Checks if there is an internet connection.
  ///
  /// Returns `true` if there is an internet connection, `false` otherwise.
  Future<bool> checkInternetConnection() async {
    final ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }

  /// Listens to internet connectivity changes.
  ///
  /// Calls the provided [callback] function with a boolean parameter indicating
  /// whether the device is connected to the internet or not.
  void listenInternetChanges(Function(bool isConnected) callback) {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        callback(false);
      } else {
        callback(true);
      }
    });
  }
}

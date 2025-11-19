import 'package:pernikhsi/core/core.dart';

/// A central configuration class that defines global constants
/// and default values for the pernikhsi application.
///
/// All values here are static and should be used across the app
/// to ensure consistency (e.g., app name, API URL, theme, etc.).
class AppConfig {
  // Private constructor to prevent instantiation
  AppConfig._();

  /// The official name of the application.
  static const String appName = 'Pernik HSI';

  /// The default font family applied throughout the app's UI.
  static const String fontFamily = 'NunitoSans';

  /// The base API URL used for network requests.
  ///
  /// Typically depends on the current app flavor (e.g., dev, staging, prod).
  static const String baseUrl = 'https://pernikhsi.example.com/api';

  /// The default theme applied when the app is first launched.
  static const AppTheme defaultTheme = AppTheme.light;

  /// Enables automatic stringification of Equatable objects
  /// for easier debugging and logging.
  static const bool autoStringifyEquatable = true;
}

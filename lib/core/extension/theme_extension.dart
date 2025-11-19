import 'package:flutter/material.dart';
import 'package:pernikhsi/core/core.dart';

/// Extension on [BuildContext] to simplify access to theme-related data.
///
/// Provides quick access to:
/// - The current [ThemeData] object
/// - The app's [AdaptiveTheme] for adaptive styling
///
/// Example usage:
/// ```dart
/// // Get current theme
/// final theme = context.theme;
///
/// // Get adaptive theme (custom styling wrapper)
/// final adaptive = context.adaptive;
///
/// // Example: using adaptive text color
/// Text(
///   "Hello",
///   style: TextStyle(color: context.adaptive.solidTextColor),
/// );
/// ```
extension ThemeExtension on BuildContext {
  /// Retrieves the current [ThemeData] from the nearest [Theme] widget.
  ThemeData get theme => Theme.of(this);

  /// Retrieves the current [AdaptiveTheme] based on the [theme].
  ///
  /// [AdaptiveTheme] is a custom wrapper that provides
  /// adaptive colors, text styles, and spacing for consistent design.
  AdaptiveTheme get adaptive => AdaptiveTheme(themeData: theme);
}

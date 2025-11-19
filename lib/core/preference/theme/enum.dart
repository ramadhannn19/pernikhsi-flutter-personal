import 'package:pernikhsi/core/core.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

/// Enum representing different themes in the application.
enum AppTheme {
  @JsonValue('light')
  light,

  @JsonValue('dark')
  dark,
}

/// Extension on [AppTheme] to convert it into [ThemeData].
extension AppThemeX on AppTheme {
  /// Convert [AppTheme] into [ThemeData].
  ThemeData toThemeData() {
    switch (this) {
      case AppTheme.dark:
        return DarkTheme(AppColors.blue).toTheme;
      case AppTheme.light:
        return LightTheme(AppColors.blue).toTheme;
    }
  }
}

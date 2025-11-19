import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Represents an adaptive theme wrapper containing commonly used
/// text styles and colors extracted from [ThemeData].
///
/// This class provides **shortcuts** for retrieving frequently used
/// text styles and color values, making UI code more concise when
/// used with [ThemeExtension] (`context.adaptive`).
///
/// Example usage:
/// ```dart
/// Text(
///   "Hello World",
///   style: context.adaptive.headingTextStyle,
/// );
///
/// Container(
///   color: context.adaptive.backgroundColor,
/// )
/// ```
class AdaptiveTheme extends Equatable {
  /// Constructs an [AdaptiveTheme] with the given [themeData].
  const AdaptiveTheme({required this.themeData});

  /// The underlying [ThemeData] containing text styles and colors.
  final ThemeData themeData;

  // ----------------------------
  // Text Styles
  // ----------------------------

  /// Heading text style (e.g., large section titles).
  TextStyle? get headingTextStyle => themeData.textTheme.headlineLarge;

  /// Title text style (e.g., app bar title).
  TextStyle? get titleTextStyle => themeData.textTheme.titleLarge;

  /// Subtitle text style (e.g., list item subtitle).
  TextStyle? get subTitleTextStyle => themeData.textTheme.titleMedium;

  /// Label text style (e.g., input labels).
  TextStyle? get labelTextStyle => themeData.textTheme.bodyLarge;

  /// Regular body text style.
  TextStyle? get regularTextStyle => themeData.textTheme.bodyMedium;

  /// Caption text style (e.g., small helper text).
  TextStyle? get captionTextStyle => themeData.textTheme.bodySmall;

  /// Button text style.
  TextStyle? get buttonTextStyle => themeData.textTheme.labelLarge;

  // ----------------------------
  // Colors
  // ----------------------------

  /// Primary color from the current theme.
  Color get primaryColor => themeData.colorScheme.primary;

  /// Background color used for scaffold backgrounds.
  Color get backgroundColor => themeData.scaffoldBackgroundColor;

  /// Disabled color used for inactive states.
  Color get disabledColor => themeData.disabledColor;

  /// Tertiary color (divider, subtle elements).
  Color get tertiaryColor => themeData.dividerColor;

  /// Secondary color from the current theme.
  Color get secondaryColor => themeData.colorScheme.secondary;

  // ----------------------------
  // Text Colors
  // ----------------------------

  /// Solid text color, usually from title styles.
  Color? get solidTextColor => titleTextStyle?.color;

  /// Regular text color, from [regularTextStyle].
  Color? get regularTextColor => regularTextStyle?.color;

  /// Tertiary text color (less emphasized), from [regularTextStyle].
  Color? get tertiaryTextColor => regularTextStyle?.color;

  /// Placeholder text color, from input decoration hints.
  Color? get placeholderTextColor =>
      themeData.inputDecorationTheme.hintStyle?.color;

  @override
  List<Object?> get props => [themeData];
}

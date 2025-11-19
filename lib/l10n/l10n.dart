import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pernikhsi/l10n/generated/app_localizations.dart';

export 'generated/app_localizations.dart';

/// Extension on [BuildContext] to provide quick access
/// to different localization delegates.
///
/// This helps reduce boilerplate by allowing direct access
/// to localized strings and Flutter's built-in material
/// and cupertino localization helpers.
///
/// Example usage:
/// ```dart
/// // Access custom app localization (generated from .arb files)
/// final hello = context.l10n.helloWorld;
///
/// // Access Material default localization (e.g., button labels)
/// final okText = context.l10nMaterial.okButtonLabel;
///
/// // Access Cupertino default localization (e.g., date picker strings)
/// final cancelText = context.l10nCupertino.cancelButtonLabel;
/// ```
extension AppLocalizationsX on BuildContext {
  /// Access the app's custom [AppLocalizations] instance.
  ///
  /// Provides access to keys defined in `.arb` files (e.g., `app_en.arb`).
  AppLocalizations get l10n => AppLocalizations.of(this)!;

  /// Access Flutter's built-in [CupertinoLocalizations].
  ///
  /// Useful for iOS-style widgets like `CupertinoDatePicker`.
  CupertinoLocalizations get l10nCupertino => CupertinoLocalizations.of(this);

  /// Access Flutter's built-in [MaterialLocalizations].
  ///
  /// Useful for Material widgets like dialogs, buttons, and menus.
  MaterialLocalizations get l10nMaterial => MaterialLocalizations.of(this);
}

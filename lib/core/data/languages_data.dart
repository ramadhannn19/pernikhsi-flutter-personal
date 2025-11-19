import 'package:pernikhsi/core/core.dart';

import 'raw/languages.dart';

/// Provides a static list of supported [Language] objects
/// for use throughout the application.
///
/// The raw language data is defined in [languagesRawData] and
/// transformed into a list of [Language] models. Each entry
/// contains a language [code] (e.g., `"en"`, `"id"`) and a
/// display [name] (e.g., `"English"`, `"Bahasa Indonesia"`).
///
/// This is typically used in:
/// - Localization / Internationalization (i18n, l10n)
/// - Language pickers in settings
/// - Determining supported translations
class LanguagesData {
  /// A static list of all supported languages.
  ///
  /// The data is generated once from [languagesRawData] and cached
  /// for reuse across the app.
  static List<Language> data = _dataFromMap();

  /// Converts [languagesRawData] into a list of [Language] objects.
  static List<Language> _dataFromMap() {
    return languagesRawData.map((data) => Language.fromJson(data)).toList();
  }
}

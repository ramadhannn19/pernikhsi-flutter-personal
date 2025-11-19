import 'package:pernikhsi/core/core.dart';

import 'raw/countries.dart';

/// Provides a static list of supported [Country] objects
/// for use across the application.
///
/// The raw country data is defined in [countriesRawData] and
/// transformed into a list of [Country] models, where each entry
/// includes its dial code, code, name, and a resolved flag asset path.
///
/// This is typically used in:
/// - Phone number inputs (prefix dial codes)
/// - Country pickers
/// - Localization or regional settings
class CountriesData {
  /// A static list of all supported countries.
  ///
  /// The data is generated from [countriesRawData] and cached
  /// for reuse throughout the app.
  static List<Country> data = _dataFromMap();

  /// Converts [countriesRawData] into a list of [Country] objects.
  ///
  /// During conversion, the [flag] field is resolved using
  /// [MainAssets.pathLanguage] based on the country code.
  static List<Country> _dataFromMap() => countriesRawData
      .map<Country>(
        (data) => Country.fromJson(data).copyWith(
          flag: MainAssets.pathLanguage(data['code'].toString().toLowerCase()),
        ),
      )
      .toList();
}

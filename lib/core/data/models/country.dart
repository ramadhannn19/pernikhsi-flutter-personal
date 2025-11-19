import 'package:pernikhsi/core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country.g.dart';

/// A model class that represents a **country**.
///
/// This model is used primarily in forms where the user needs to
/// select a country (e.g., phone number input with dial code).
/// It supports JSON serialization and value comparison.
///
/// Fields include:
/// - [dialCode] → country dial code (e.g., +62 for Indonesia)
/// - [code] → ISO country code (e.g., ID)
/// - [flag] → asset path to the flag image
/// - [name] → full country name (e.g., Indonesia)
@JsonSerializable()
class Country extends Equatable {
  /// The dial code of the country.
  ///
  /// Example: `+62` (Indonesia), `+1` (United States).
  @JsonKey(name: 'dial_code', fromJson: StringParser.parse)
  final String dialCode;

  /// The ISO 2-letter country code.
  ///
  /// Example: `ID`, `US`, `GB`.
  @JsonKey(fromJson: StringParser.parse)
  final String code;

  /// The flag asset representing the country.
  ///
  /// This is typically a local asset path (e.g., `assets/flags/id.png`).
  @JsonKey(fromJson: StringParser.parse)
  final String flag;

  /// The human-readable name of the country.
  ///
  /// Example: `Indonesia`, `United States`.
  @JsonKey(fromJson: StringParser.parse)
  final String name;

  /// Constructs a [Country] instance.
  const Country({
    required this.dialCode,
    required this.code,
    required this.flag,
    required this.name,
  });

  /// Creates a [Country] instance from JSON.
  ///
  /// Example:
  /// ```dart
  /// final country = Country.fromJson({
  ///   "dial_code": "+62",
  ///   "code": "ID",
  ///   "flag": "assets/flags/id.png",
  ///   "name": "Indonesia"
  /// });
  /// ```
  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  /// Converts this [Country] instance into a JSON object.
  Map<String, dynamic> toJson() => _$CountryToJson(this);

  /// Creates a copy of this [Country] with optional new values.
  ///
  /// Example:
  /// ```dart
  /// final updated = country.copyWith(name: "Republik Indonesia");
  /// ```
  Country copyWith({
    String? dialCode,
    String? code,
    String? flag,
    String? name,
  }) {
    return Country(
      dialCode: dialCode ?? this.dialCode,
      code: code ?? this.code,
      flag: flag ?? this.flag,
      name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props => [dialCode, code, flag, name];
}

import 'package:pernikhsi/core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'language.g.dart';

/// A model class that represents a **language option** in the application.
///
/// This model is typically used for internationalization (i18n) and
/// localization (l10n), where users can choose their preferred language.
///
/// Fields include:
/// - [code] → the language code (e.g., "en", "id")
/// - [name] → the human-readable language name (e.g., "English", "Bahasa Indonesia")
@JsonSerializable()
class Language extends Equatable {
  /// The short code for the language (usually ISO 639-1).
  ///
  /// Example: `"en"` for English, `"id"` for Indonesian.
  @JsonKey(fromJson: StringParser.parse)
  final String code;

  /// The display name of the language.
  ///
  /// Example: `"English"`, `"Bahasa Indonesia"`.
  @JsonKey(fromJson: StringParser.parse)
  final String name;

  /// Constructs a [Language] instance.
  const Language({required this.code, required this.name});

  /// Creates a [Language] instance from JSON data.
  ///
  /// Example:
  /// ```dart
  /// final lang = Language.fromJson({
  ///   "code": "en",
  ///   "name": "English"
  /// });
  /// ```
  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);

  /// Converts this [Language] instance to a JSON object.
  Map<String, dynamic> toJson() => _$LanguageToJson(this);

  /// Creates a copy of this [Language] with optional new values.
  ///
  /// Example:
  /// ```dart
  /// final updated = lang.copyWith(name: "US English");
  /// ```
  Language copyWith({String? code, String? name}) {
    return Language(code: code ?? this.code, name: name ?? this.name);
  }

  @override
  List<Object?> get props => [code, name];
}

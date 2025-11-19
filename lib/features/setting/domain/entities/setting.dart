import 'package:pernikhsi/app/config.dart';
import 'package:pernikhsi/core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'setting.g.dart';

/// Represents user settings for the application.
///
/// Contains preferences that affect the app's behavior and appearance:
/// - [language]: the selected app language
/// - [theme]: the selected app theme
///
/// This entity is:
/// - Serializable (via `json_serializable`)
/// - Comparable (via [Equatable])
/// - Immutable (use [copyWith] to create modified instances)
///
/// ### Usage
/// ```dart
/// // Create new settings
/// final setting = Setting(language: Language(code: 'en', name: 'English'), theme: AppTheme.light);
///
/// // Update only the theme
/// final updated = setting.copyWith(theme: AppTheme.dark);
///
/// // Convert to JSON
/// final json = setting.toJson();
///
/// // Convert from JSON
/// final restored = Setting.fromJson(json);
/// ```
@JsonSerializable(includeIfNull: false)
class Setting extends Equatable {
  /// Creates a new [Setting] with the given [language] and [theme].
  const Setting({required this.language, required this.theme});

  /// Creates a [Setting] from JSON.
  factory Setting.fromJson(Map<String, dynamic> json) =>
      _$SettingFromJson(json);

  /// The current app language.
  @JsonKey(name: 'language')
  final Language? language;

  /// The current app theme.
  ///
  /// Defaults to [AppConfig.defaultTheme] if not specified or unrecognized.
  @JsonKey(
    unknownEnumValue: AppConfig.defaultTheme,
    defaultValue: AppConfig.defaultTheme,
  )
  final AppTheme? theme;

  /// Creates a copy of this [Setting] with updated fields.
  ///
  /// Example:
  /// ```dart
  /// final updated = setting.copyWith(theme: AppTheme.dark);
  /// ```
  Setting copyWith({Language? language, AppTheme? theme}) {
    return Setting(
      language: language ?? this.language,
      theme: theme ?? this.theme,
    );
  }

  /// Converts this [Setting] into a JSON map.
  Map<String, dynamic> toJson() => _$SettingToJson(this);

  @override
  List<Object?> get props => [language, theme];
}

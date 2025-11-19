// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Setting _$SettingFromJson(Map<String, dynamic> json) => Setting(
  language: json['language'] == null
      ? null
      : Language.fromJson(json['language'] as Map<String, dynamic>),
  theme:
      $enumDecodeNullable(
        _$AppThemeEnumMap,
        json['theme'],
        unknownValue: AppTheme.light,
      ) ??
      AppTheme.light,
);

Map<String, dynamic> _$SettingToJson(Setting instance) => <String, dynamic>{
  'language': ?instance.language,
  'theme': ?_$AppThemeEnumMap[instance.theme],
};

const _$AppThemeEnumMap = {AppTheme.light: 'light', AppTheme.dark: 'dark'};

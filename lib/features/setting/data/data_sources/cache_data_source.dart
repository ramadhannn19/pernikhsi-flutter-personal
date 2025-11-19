import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:pernikhsi/app/config.dart';
import 'package:pernikhsi/core/core.dart';
import 'package:pernikhsi/features/setting/setting.dart';

/// Contract for caching user settings locally.
///
/// Extends [CacheDataSource] to enforce a consistent cache API across features.
/// Provides specialized methods for:
/// - Updating theme
/// - Updating language
/// - Tracking onboarding completion
abstract class SettingCacheDataSource implements CacheDataSource<Setting> {
  /// Persists a new [AppTheme] to cache.
  Future<bool> setTheme(AppTheme theme);

  /// Persists a new [Language] to cache.
  Future<bool> setLanguage(Language language);

  /// Marks onboarding as completed in cache.
  Future<bool> setDoneOnboarding();

  /// Returns whether the user has completed onboarding.
  Future<bool> getOnboardingStatus();
}

/// Hive-based implementation of [SettingCacheDataSource].
///
/// Responsibilities:
/// - Uses Hive for lightweight, key-value local storage
/// - Stores `Setting` object (theme + language) in JSON format
/// - Caches onboarding completion status
///
/// ### Storage strategy
/// - `data` → JSON string of [Setting]
/// - `onboarding_status` → `true`/`false` flag
///
/// ### Error handling
/// - Wraps errors into [CacheException]
/// - Throws [NotFoundCacheException] if no settings are found
class SettingCacheDataSourceImpl implements SettingCacheDataSource {
  SettingCacheDataSourceImpl(this.hive);

  /// Hive interface instance (injected for easier testing/mocking).
  final HiveInterface hive;

  @override
  String cacheKey = 'SETTING_CACHE_KEY';

  @override
  Future<bool> clearCache() async {
    try {
      final box = await _getBox();
      await box?.clear();
      return true;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<Setting> getData() async {
    try {
      final box = await _getBox();
      final boxData = box?.get('data');
      if (boxData != null && boxData is String) {
        return Setting.fromJson(json.decode(boxData) as Map<String, dynamic>);
      }

      throw const NotFoundCacheException(message: 'Cache Not Found');
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<bool> isCached() async {
    try {
      final box = await _getBox();
      return box?.get('data') != null;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<bool> saveCache(Setting data) async {
    try {
      final box = await _getBox();
      await box?.put('data', json.encode(data.toJson()));
      return true;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  /// Opens (or returns) the Hive box for settings.
  Future<Box<Object?>?> _getBox() async {
    if (!hive.isBoxOpen(cacheKey)) {
      return hive.openBox(cacheKey);
    }
    return hive.box(cacheKey);
  }

  @override
  Future<bool> setLanguage(Language language) async {
    try {
      if (await isCached()) {
        final currentData = await getData();
        await saveCache(currentData.copyWith(language: language));
        return true;
      }

      // if not cached, create new Setting with default theme
      await saveCache(
        Setting(theme: AppConfig.defaultTheme, language: language),
      );
      return true;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<bool> setTheme(AppTheme theme) async {
    try {
      if (await isCached()) {
        final currentData = await getData();
        await saveCache(currentData.copyWith(theme: theme));
        return true;
      }

      // if not cached, create new Setting with theme only
      await saveCache(Setting(theme: theme, language: null));
      return true;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<bool> getOnboardingStatus() async {
    try {
      final box = await _getBox();
      final status = box?.get('onboarding_status');
      return status == true;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<bool> setDoneOnboarding() async {
    try {
      final box = await _getBox();
      await box?.put('onboarding_status', true);
      return true;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}

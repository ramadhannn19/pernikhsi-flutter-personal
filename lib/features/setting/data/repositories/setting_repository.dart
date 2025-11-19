import 'package:pernikhsi/core/core.dart';
import 'package:pernikhsi/features/setting/setting.dart';
import 'package:dartz/dartz.dart';

/// Implementation of [SettingRepository] that interacts with the local
/// cache via [SettingCacheDataSource].
///
/// Responsibilities:
/// - Provides a clean API for the domain layer to access settings data
/// - Delegates persistence logic to [SettingCacheDataSource]
/// - Maps [CacheException]s into [Failure] objects for safer handling
///
/// ### Features supported:
/// - Save and retrieve full [Setting]
/// - Save and retrieve individual preferences (theme, language)
/// - Manage onboarding status
///
/// ### Error handling:
/// - Wraps all calls in `try/catch`
/// - Converts [CacheException] → [CacheFailure]
/// - Uses `Either<Failure, T>` so domain layer always has a predictable API
class SettingRepositoryImpl implements SettingRepository {
  SettingRepositoryImpl(this.cache);

  /// The cache data source (Hive implementation).
  final SettingCacheDataSource cache;

  @override
  Future<Either<Failure, Language>> getLanguageSetting() async {
    try {
      final result = await cache.getData();

      if (result.language != null) {
        return Right(result.language!);
      }
      throw const NotFoundCacheException(message: 'Cache Not Found');
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, code: e.code));
    }
  }

  @override
  Future<Either<Failure, Setting>> getSetting() async {
    try {
      final result = await cache.getData();
      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, code: e.code));
    }
  }

  @override
  Future<Either<Failure, AppTheme>> getThemeSetting() async {
    try {
      final result = await cache.getData();

      if (result.theme != null) {
        return Right(result.theme!);
      }
      throw const NotFoundCacheException(message: 'Cache Not Found');
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, code: e.code));
    }
  }

  @override
  Future<Either<Failure, bool>> saveSetting(Setting setting) async {
    try {
      final result = await cache.saveCache(setting);
      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, code: e.code));
    }
  }

  @override
  Future<Either<Failure, bool>> saveLanguageSetting(Language language) async {
    try {
      final result = await cache.setLanguage(language);
      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, code: e.code));
    }
  }

  @override
  Future<Either<Failure, bool>> saveThemeSetting(AppTheme theme) async {
    try {
      final result = await cache.setTheme(theme);
      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, code: e.code));
    }
  }

  @override
  Future<Either<Failure, bool>> getOnboardingStatus() async {
    try {
      final result = await cache.getOnboardingStatus();
      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, code: e.code));
    }
  }

  @override
  Future<Either<Failure, bool>> setDoneOnboarding() async {
    try {
      final result = await cache.setDoneOnboarding();
      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, code: e.code));
    }
  }
}

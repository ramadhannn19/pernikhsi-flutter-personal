import 'package:pernikhsi/core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:pernikhsi/features/setting/setting.dart';

/// Abstract contract for the Settings repository.
///
/// This defines all operations related to **user preferences** such as:
/// - App theme (light/dark/system)
/// - Language (localization)
/// - Onboarding status (whether user has completed onboarding)
///
/// ### Responsibilities
/// - Expose methods for saving and retrieving user settings
/// - Hide implementation details (Hive, SharedPreferences, API, etc.)
/// - Ensure consistent error handling using `Either<Failure, T>`
///
/// ### Error handling
/// - On success: returns `Right(result)`
/// - On failure: returns `Left(Failure)`
///
/// ### Typical flow
/// - **UI** → Bloc → UseCase → [SettingRepository] → Cache/DataSource → Hive
///
/// Example usage:
/// ```dart
/// final repo = SettingRepositoryImpl(cacheDataSource);
///
/// final themeResult = await repo.getThemeSetting();
/// themeResult.fold(
///   (failure) => print("Error: ${failure.message}"),
///   (theme) => print("Theme loaded: $theme"),
/// );
/// ```
abstract class SettingRepository {
  /// Retrieve the full [Setting] object (theme + language).
  Future<Either<Failure, Setting>> getSetting();

  /// Save a full [Setting] object.
  Future<Either<Failure, bool>> saveSetting(Setting setting);

  /// Retrieve only the app [AppTheme] setting.
  Future<Either<Failure, AppTheme>> getThemeSetting();

  /// Retrieve only the [Language] setting.
  Future<Either<Failure, Language>> getLanguageSetting();

  /// Save only the app [AppTheme].
  Future<Either<Failure, bool>> saveThemeSetting(AppTheme theme);

  /// Save only the app [Language].
  Future<Either<Failure, bool>> saveLanguageSetting(Language language);

  /// Get whether the user has completed onboarding.
  Future<Either<Failure, bool>> getOnboardingStatus();

  /// Mark onboarding as completed.
  Future<Either<Failure, bool>> setDoneOnboarding();
}

import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:pernikhsi/core/core.dart';
import 'package:pernikhsi/features/setting/setting.dart';

/// Use case for saving the selected [AppTheme] setting.
///
/// Responsibilities:
/// - Provides domain-level entry point for updating the app's theme
/// - Delegates persistence logic to [SettingRepository]
/// - Ensures safe error handling using [Either]<[Failure], bool>
///
/// ### Example usage in BLoC
/// ```dart
/// class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
///   ThemeBloc(this.saveThemeSetting) : super(ThemeInitial()) {
///     on<ChangeThemeEvent>(_onChangeTheme);
///   }
///
///   final SaveThemeSettingUseCase saveThemeSetting;
///
///   Future<void> _onChangeTheme(
///     ChangeThemeEvent event,
///     Emitter<ThemeState> emit,
///   ) async {
///     emit(ThemeSaving());
///     final result = await saveThemeSetting(event.theme);
///     result.fold(
///       (failure) => emit(ThemeError(failure.message)),
///       (_) => emit(ThemeSaved(event.theme)),
///     );
///   }
/// }
/// ```
///
/// ### Return type
/// - `Right(true)` → theme was saved successfully
/// - `Left(Failure)` → error occurred while saving
class SaveThemeSettingUseCase
    implements UseCaseFuture<Failure, bool, AppTheme> {
  /// Creates a [SaveThemeSettingUseCase] with the given [SettingRepository].
  SaveThemeSettingUseCase(this.repository);

  /// Repository that persists theme preferences.
  final SettingRepository repository;

  @override
  FutureOr<Either<Failure, bool>> call(AppTheme params) {
    return repository.saveThemeSetting(params);
  }
}

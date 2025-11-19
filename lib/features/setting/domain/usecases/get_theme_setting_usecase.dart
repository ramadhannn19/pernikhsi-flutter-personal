import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:pernikhsi/core/core.dart';
import 'package:pernikhsi/features/setting/setting.dart';

/// Use case for retrieving the current [AppTheme] setting.
///
/// Responsibilities:
/// - Provides a domain-level entry point to get the app's theme
/// - Delegates to [SettingRepository] which abstracts cache/data source
/// - Returns result wrapped in [Either] to handle failures safely
///
/// ### Example usage in BLoC
/// ```dart
/// class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
///   ThemeBloc(this.getThemeSetting) : super(ThemeInitial()) {
///     on<LoadThemeEvent>(_onLoadTheme);
///   }
///
///   final GetThemeSettingUseCase getThemeSetting;
///
///   Future<void> _onLoadTheme(
///     LoadThemeEvent event,
///     Emitter<ThemeState> emit,
///   ) async {
///     emit(ThemeLoading());
///     final result = await getThemeSetting(const NoParams());
///     result.fold(
///       (failure) => emit(ThemeError(failure.message)),
///       (theme) => emit(ThemeLoaded(theme)),
///     );
///   }
/// }
/// ```
///
/// ### Return type
/// - `Right(AppTheme)` → current theme (light, dark, etc.)
/// - `Left(Failure)` → error occurred while retrieving theme
class GetThemeSettingUseCase
    implements UseCaseFuture<Failure, AppTheme, NoParams> {
  /// Creates a [GetThemeSettingUseCase] with the given [SettingRepository].
  GetThemeSettingUseCase(this.repository);

  /// Repository providing theme setting access.
  final SettingRepository repository;

  @override
  FutureOr<Either<Failure, AppTheme>> call(NoParams params) {
    return repository.getThemeSetting();
  }
}

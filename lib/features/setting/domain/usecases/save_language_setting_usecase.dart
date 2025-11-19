import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:pernikhsi/core/core.dart';
import 'package:pernikhsi/features/setting/setting.dart';

/// Use case for saving the selected [Language] setting.
///
/// Responsibilities:
/// - Provides domain-level entry point for updating the app language
/// - Delegates persistence to [SettingRepository]
/// - Returns success/failure wrapped in [Either]
///
/// ### Example usage in BLoC
/// ```dart
/// class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
///   LanguageBloc(this.saveLanguageSetting) : super(LanguageInitial()) {
///     on<ChangeLanguageEvent>(_onChangeLanguage);
///   }
///
///   final SaveLanguageSettingUseCase saveLanguageSetting;
///
///   Future<void> _onChangeLanguage(
///     ChangeLanguageEvent event,
///     Emitter<LanguageState> emit,
///   ) async {
///     emit(LanguageSaving());
///     final result = await saveLanguageSetting(event.language);
///     result.fold(
///       (failure) => emit(LanguageError(failure.message)),
///       (_) => emit(LanguageSaved(event.language)),
///     );
///   }
/// }
/// ```
///
/// ### Return type
/// - `Right(true)` → language was saved successfully
/// - `Left(Failure)` → an error occurred while saving
class SaveLanguageSettingUseCase
    implements UseCaseFuture<Failure, bool, Language> {
  /// Creates a [SaveLanguageSettingUseCase] with the given [SettingRepository].
  SaveLanguageSettingUseCase(this.repository);

  /// Repository that persists language preferences.
  final SettingRepository repository;

  @override
  FutureOr<Either<Failure, bool>> call(Language params) {
    return repository.saveLanguageSetting(params);
  }
}

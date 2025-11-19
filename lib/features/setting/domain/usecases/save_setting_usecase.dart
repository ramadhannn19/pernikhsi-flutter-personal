import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:pernikhsi/core/core.dart';
import 'package:pernikhsi/features/setting/setting.dart';

/// Use case for saving the entire [Setting] object,
/// which may include both [Language] and [AppTheme].
///
/// Responsibilities:
/// - Provides a domain entry point for updating all user preferences at once
/// - Delegates persistence to [SettingRepository]
/// - Wraps the result in [Either] for safe error handling
///
/// ### Example usage in BLoC
/// ```dart
/// class SettingBloc extends Bloc<SettingEvent, SettingState> {
///   SettingBloc(this.saveSetting) : super(SettingInitial()) {
///     on<UpdateSettingEvent>(_onUpdateSetting);
///   }
///
///   final SaveSettingUseCase saveSetting;
///
///   Future<void> _onUpdateSetting(
///     UpdateSettingEvent event,
///     Emitter<SettingState> emit,
///   ) async {
///     emit(SettingSaving());
///     final result = await saveSetting(event.setting);
///     result.fold(
///       (failure) => emit(SettingError(failure.message)),
///       (_) => emit(SettingSaved(event.setting)),
///     );
///   }
/// }
/// ```
///
/// ### Return type
/// - `Right(true)` → settings were saved successfully
/// - `Left(Failure)` → an error occurred while saving
class SaveSettingUseCase implements UseCaseFuture<Failure, bool, Setting> {
  /// Creates a [SaveSettingUseCase] with the given [SettingRepository].
  SaveSettingUseCase(this.repository);

  /// Repository that persists full app settings.
  final SettingRepository repository;

  @override
  FutureOr<Either<Failure, bool>> call(Setting params) {
    return repository.saveSetting(params);
  }
}

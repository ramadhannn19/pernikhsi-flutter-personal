import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:pernikhsi/core/core.dart';
import 'package:pernikhsi/features/setting/setting.dart';

/// Use case for retrieving the full [Setting] object,
/// which contains both [Language] and [AppTheme].
///
/// Responsibilities:
/// - Acts as a domain entry point for reading user preferences
/// - Delegates to [SettingRepository] to fetch the data from cache/storage
/// - Returns result wrapped in [Either] to handle success/failure safely
///
/// ### Example usage in BLoC
/// ```dart
/// class SettingBloc extends Bloc<SettingEvent, SettingState> {
///   SettingBloc(this.getSetting) : super(SettingInitial()) {
///     on<LoadSettingEvent>(_onLoadSetting);
///   }
///
///   final GetSettingUseCase getSetting;
///
///   Future<void> _onLoadSetting(
///     LoadSettingEvent event,
///     Emitter<SettingState> emit,
///   ) async {
///     emit(SettingLoading());
///     final result = await getSetting(const NoParams());
///     result.fold(
///       (failure) => emit(SettingError(failure.message)),
///       (setting) => emit(SettingLoaded(setting)),
///     );
///   }
/// }
/// ```
///
/// ### Return type
/// - `Right(Setting)` → returns the full setting (language + theme)
/// - `Left(Failure)` → error occurred while retrieving settings
class GetSettingUseCase implements UseCaseFuture<Failure, Setting, NoParams> {
  /// Creates a [GetSettingUseCase] with the given [SettingRepository].
  GetSettingUseCase(this.repository);

  /// Repository that provides access to app settings.
  final SettingRepository repository;

  @override
  FutureOr<Either<Failure, Setting>> call(NoParams params) {
    return repository.getSetting();
  }
}

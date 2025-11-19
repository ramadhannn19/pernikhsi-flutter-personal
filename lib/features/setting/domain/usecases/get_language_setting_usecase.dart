import 'dart:async';
import 'package:pernikhsi/core/core.dart';
import 'package:pernikhsi/features/setting/setting.dart';
import 'package:dartz/dartz.dart';

/// Use case for retrieving the current [Language] setting.
///
/// Responsibilities:
/// - Acts as an entry point for the domain layer
/// - Delegates to [SettingRepository] to fetch the cached or stored language
/// - Returns a safe result wrapped in [Either]<[Failure], [Language]>
///
/// ### Usage in BLoC
/// ```dart
/// class SettingBloc extends Bloc<SettingEvent, SettingState> {
///   SettingBloc(this.getLanguageSetting) : super(SettingInitial()) {
///     on<LoadLanguageEvent>(_onLoadLanguage);
///   }
///
///   final GetLanguageSettingUseCase getLanguageSetting;
///
///   Future<void> _onLoadLanguage(
///     LoadLanguageEvent event,
///     Emitter<SettingState> emit,
///   ) async {
///     emit(SettingLoading());
///     final result = await getLanguageSetting(const NoParams());
///     result.fold(
///       (failure) => emit(SettingError(failure.message)),
///       (language) => emit(SettingLanguageLoaded(language)),
///     );
///   }
/// }
/// ```
///
/// ### Why NoParams?
/// Since this use case does not need any input, [NoParams] is used
/// as a placeholder for consistency across use cases.
class GetLanguageSettingUseCase
    implements UseCaseFuture<Failure, Language, NoParams> {
  /// Creates a [GetLanguageSettingUseCase] with the given [SettingRepository].
  GetLanguageSettingUseCase(this.repository);

  /// Repository providing access to language setting.
  final SettingRepository repository;

  @override
  FutureOr<Either<Failure, Language>> call(NoParams params) {
    return repository.getLanguageSetting();
  }
}

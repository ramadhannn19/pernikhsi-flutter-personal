import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:pernikhsi/core/core.dart';
import 'package:pernikhsi/features/setting/setting.dart';

/// Use case for marking onboarding as completed.
///
/// Responsibilities:
/// - Provides domain-level entry point to update onboarding status
/// - Delegates persistence logic to [SettingRepository]
/// - Ensures safe error handling using [Either]<[Failure], bool>
///
/// ### Usage in BLoC
/// ```dart
/// class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
///   OnboardingBloc(this.setDoneOnboarding) : super(OnboardingInitial()) {
///     on<CompleteOnboardingEvent>(_onCompleteOnboarding);
///   }
///
///   final SetDoneOnboardingUseCase setDoneOnboarding;
///
///   Future<void> _onCompleteOnboarding(
///     CompleteOnboardingEvent event,
///     Emitter<OnboardingState> emit,
///   ) async {
///     emit(OnboardingSaving());
///     final result = await setDoneOnboarding(const NoParams());
///     result.fold(
///       (failure) => emit(OnboardingError(failure.message)),
///       (_) => emit(OnboardingCompleted()),
///     );
///   }
/// }
/// ```
///
/// ### Return type
/// - `Right(true)` → onboarding status was updated successfully
/// - `Left(Failure)` → error occurred while saving onboarding status
class SetDoneOnboardingUseCase
    implements UseCaseFuture<Failure, bool, NoParams> {
  /// Creates a [SetDoneOnboardingUseCase] with the given [SettingRepository].
  const SetDoneOnboardingUseCase(this.repository);

  /// Repository that persists onboarding status.
  final SettingRepository repository;

  @override
  FutureOr<Either<Failure, bool>> call(NoParams params) {
    return repository.setDoneOnboarding();
  }
}

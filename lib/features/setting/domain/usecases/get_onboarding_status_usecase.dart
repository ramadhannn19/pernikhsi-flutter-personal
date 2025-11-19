import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:pernikhsi/core/core.dart';
import 'package:pernikhsi/features/setting/setting.dart';

/// Use case for checking whether the user has completed onboarding.
///
/// Responsibilities:
/// - Serves as the domain entry point for onboarding status checks
/// - Delegates to [SettingRepository] which abstracts data/cache storage
/// - Returns result wrapped in [Either] to ensure safe error handling
///
/// ### Usage in BLoC
/// ```dart
/// class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
///   OnboardingBloc(this.getOnboardingStatus) : super(OnboardingInitial()) {
///     on<CheckOnboardingEvent>(_onCheckOnboarding);
///   }
///
///   final GetOnboardingStatusUseCase getOnboardingStatus;
///
///   Future<void> _onCheckOnboarding(
///     CheckOnboardingEvent event,
///     Emitter<OnboardingState> emit,
///   ) async {
///     emit(OnboardingLoading());
///     final result = await getOnboardingStatus(const NoParams());
///     result.fold(
///       (failure) => emit(OnboardingError(failure.message)),
///       (isDone) => emit(OnboardingStatusLoaded(isDone)),
///     );
///   }
/// }
/// ```
///
/// ### Return type
/// - `Right(true)` → user has completed onboarding
/// - `Right(false)` → user has not completed onboarding
/// - `Left(Failure)` → error occurred while reading onboarding status
class GetOnboardingStatusUseCase
    implements UseCaseFuture<Failure, bool, NoParams> {
  /// Creates a [GetOnboardingStatusUseCase] with the given [SettingRepository].
  const GetOnboardingStatusUseCase(this.repository);

  /// Repository that provides onboarding status.
  final SettingRepository repository;

  @override
  FutureOr<Either<Failure, bool>> call(NoParams params) {
    return repository.getOnboardingStatus();
  }
}

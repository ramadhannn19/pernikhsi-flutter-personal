import 'dart:async';
import 'package:pernikhsi/core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:pernikhsi/features/home/home.dart' show HomeRepository;

/// A use case for retrieving an example result from the [HomeRepository].
///
/// Responsibilities:
/// - Acts as a boundary between the UI and the repository layer
/// - Delegates the actual data fetching to [HomeRepository]
/// - Ensures consistent return type: [Either]<[Failure], bool>
///
/// ### Example usage in BLoC:
/// ```dart
/// class HomeBloc extends Bloc<HomeEvent, HomeState> {
///   HomeBloc(this.getExample) : super(HomeInitial()) {
///     on<LoadExampleEvent>(_onLoadExample);
///   }
///
///   final GetExampleUsecase getExample;
///
///   Future<void> _onLoadExample(
///     LoadExampleEvent event,
///     Emitter<HomeState> emit,
///   ) async {
///     emit(HomeLoading());
///     final result = await getExample(const NoParams());
///     result.fold(
///       (failure) => emit(HomeError(failure.message)),
///       (success) => emit(HomeLoaded(success)),
///     );
///   }
/// }
/// ```
///
/// ### Why NoParams?
/// Since this use case does not require any input,
/// it uses [NoParams] as a placeholder type for consistency.
class GetExampleUsecase implements UseCaseFuture<Failure, bool, NoParams> {
  /// Creates a [GetExampleUsecase] with the provided [HomeRepository].
  GetExampleUsecase(this.repository);

  /// The repository that provides the data.
  final HomeRepository repository;

  @override
  FutureOr<Either<Failure, bool>> call(NoParams params) {
    return repository.example();
  }
}

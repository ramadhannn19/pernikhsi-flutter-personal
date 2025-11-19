import 'package:get_it/get_it.dart' show GetIt;
import 'package:pernikhsi/core/core.dart';
import 'package:dartz/dartz.dart';

/// A use case for capturing and reporting errors.
///
/// This use case is designed to centralize error logging,
/// e.g., sending exceptions to crash reporting services like
/// Firebase Crashlytics or Sentry. Currently, it is stubbed
/// and always returns `Right(true)`.
///
/// Example usage:
/// ```dart
/// try {
///   // risky operation
/// } catch (e, stack) {
///   final params = CaptureErrorParams(e, stack);
///   await GetIt.I<CaptureErrorUseCase>().call(params);
/// }
/// ```
class CaptureErrorUseCase
    implements UseCaseFuture<Failure, bool, CaptureErrorParams> {
  /// Constructs a [CaptureErrorUseCase].
  ///
  /// Replace with dependency injection if integrating with services
  /// like Firebase Crashlytics.
  // CaptureErrorUseCase(this.firebaseCrashlytics);
  // final FirebaseCrashlytics firebaseCrashlytics;

  @override
  Future<Either<Failure, bool>> call(CaptureErrorParams params) async {
    try {
      // Example integration:
      // await firebaseCrashlytics.recordError(
      //   params.exception,
      //   params.stackTrace as StackTrace?,
      // );

      return const Right(true);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}

/// Parameters required for capturing an error.
///
/// Encapsulates the exception and stack trace information
/// to be reported.
class CaptureErrorParams {
  /// Constructs [CaptureErrorParams] with an [exception] and [stackTrace].
  CaptureErrorParams(this.exception, this.stackTrace);

  /// The exception object to be captured.
  final Object exception;

  /// The stack trace associated with the exception.
  final dynamic stackTrace;
}

/// Extension method for any [Object] to simplify error reporting.
///
/// Instead of calling the use case directly, you can call:
/// ```dart
/// try {
///   throw Exception("Boom!");
/// } catch (e, stack) {
///   e.recordError(CaptureErrorParams(e, stack));
/// }
/// ```
extension RecordErrorExtensions on Object {
  /// Records the current error using the global [CaptureErrorUseCase].
  void recordError(CaptureErrorParams params) {
    GetIt.I<CaptureErrorUseCase>()(params);
  }
}

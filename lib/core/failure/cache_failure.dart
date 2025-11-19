import 'package:pernikhsi/core/core.dart';

/// Represents a failure related to caching operations.
///
/// This failure type is typically returned when something goes wrong
/// with local storage or cache handling, such as:
/// - Failed to save data to cache
/// - Failed to retrieve cached data
/// - Cache corruption or read error
///
/// Example usage:
/// ```dart
/// Future<Either<Failure, User>> getUser() async {
///   try {
///     final data = await cache.getData();
///     return Right(data);
///   } on CacheException catch (e) {
///     return Left(CacheFailure(message: e.message, code: e.code));
///   }
/// }
/// ```
class CacheFailure extends Failure {
  /// Constructs a [CacheFailure] with a [message] and optional [code] and [error] payload.
  const CacheFailure({required super.message, super.code, super.error});

  @override
  String toString() => message;
}

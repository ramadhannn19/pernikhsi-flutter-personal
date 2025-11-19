import 'package:pernikhsi/core/core.dart';

/// Represents a failure related to server communication.
///
/// This failure type is typically used when an operation fails
/// due to issues on the server side or with network/API responses.
///
/// Common scenarios:
/// - API request failed with HTTP error (e.g., 401, 403, 500)
/// - Server returned an unexpected response
/// - Network layer mapped a [ServerException] into a domain [Failure]
///
/// Example usage:
/// ```dart
/// Future<Either<Failure, User>> getUserProfile() async {
///   try {
///     final response = await dio.get("/user/profile");
///     return Right(User.fromJson(response.data));
///   } on DioException catch (e) {
///     return Left(ServerFailure(message: e.message ?? "Server error"));
///   }
/// }
/// ```
class ServerFailure extends Failure {
  /// Constructs a [ServerFailure] with a [message], and optional [code] or [error] payload.
  const ServerFailure({required super.message, super.code, super.error});

  @override
  String toString() => message;
}

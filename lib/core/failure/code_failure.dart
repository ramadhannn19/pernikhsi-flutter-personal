import 'package:pernikhsi/core/core.dart';

/// Represents a failure related to code-level or domain-specific errors.
///
/// This failure type is useful for situations where an operation fails
/// due to a specific error code or business logic condition that
/// doesn't directly map to cache or server failures.
///
/// Example use cases:
/// - Backend returns a domain-specific error code (e.g., `"USER_ALREADY_EXISTS"`)
/// - Validation fails with a mapped error code
/// - Application logic enforces a business rule that is violated
///
/// Example:
/// ```dart
/// if (userAlreadyExists) {
///   return Left(CodeFailure(
///     message: "User already exists",
///     code: "USER_ALREADY_EXISTS",
///   ));
/// }
/// ```
class CodeFailure extends Failure {
  /// Constructs a [CodeFailure] with the provided [message] and optional [code] or [error] payload.
  const CodeFailure({required super.message, super.code, super.error});

  @override
  String toString() => message;
}

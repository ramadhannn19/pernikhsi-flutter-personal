/// Exception thrown when an error occurs with a specific error code.
///
/// This can be used for handling domain-specific errors
/// where an operation fails and a code/message pair is provided.
///
/// Example use cases:
/// - API returns a business logic error with a specific code
/// - Validation fails with a custom code to identify the rule
///
/// Example:
/// ```dart
/// throw ErrorCodeException(
///   message: "Invalid credentials",
///   code: 401,
/// );
/// ```
class ErrorCodeException implements Exception {
  /// Constructs an [ErrorCodeException].
  ///
  /// [message] is the error description, while [code] is an
  /// optional identifier for the error type.
  const ErrorCodeException({required this.message, this.code});

  /// Human-readable error message.
  final String message;

  /// Optional error code (e.g., HTTP status, validation rule ID).
  final Object? code;

  @override
  String toString() => message;
}

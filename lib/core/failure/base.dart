import 'package:equatable/equatable.dart';

/// Base class for representing failures in the application.
///
/// A [Failure] is part of the **domain layer error handling pattern**,
/// usually returned by use cases or repositories to indicate that an operation
/// did not succeed. Unlike [Exception], which is typically thrown,
/// [Failure] objects are passed around as values (functional error handling).
///
/// Extend this class to create custom failure types, such as:
/// - `ServerFailure` → API/server-related errors
/// - `CacheFailure` → local storage or caching issues
/// - `ValidationFailure` → invalid user input
///
/// Fields:
/// - [message] → human-readable description of the failure
/// - [code] → optional error code (e.g., HTTP status, system code)
/// - [errorCode] → optional domain-specific error identifier
/// - [error] → optional error payload (e.g., validation details)
///
/// Example:
/// ```dart
/// class ServerFailure extends Failure {
///   const ServerFailure({required String message, Object? code})
///       : super(message: message, code: code);
/// }
///
/// final failure = ServerFailure(message: "Unauthorized", code: 401);
/// print(failure.message); // Unauthorized
/// ```
abstract class Failure extends Equatable {
  /// The message describing the failure.
  final String message;

  /// Optional system or transport-level error code (e.g., HTTP status).
  final Object? code;

  /// Optional domain-specific error code.
  ///
  /// This is different from [code], and is usually mapped from
  /// backend or business rules (e.g., `"USER_NOT_FOUND"`).
  final String? errorCode;

  /// Optional additional error payload, such as validation details.
  final Map<String, dynamic>? error;

  /// Constructs a [Failure] with the provided [message], [code], [errorCode], and [error].
  const Failure({required this.message, this.code, this.errorCode, this.error});

  @override
  List<Object?> get props => [message, code, errorCode, error];
}

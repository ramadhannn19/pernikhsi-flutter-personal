/// Abstract base class representing a server exception.
///
/// All server-related exceptions should extend this class.
/// Provides a common structure for holding:
/// - [message] → human-readable error message
/// - [code] → optional error code (e.g., HTTP status)
/// - [error] → optional error payload (map of details)
abstract class ServerException implements Exception {
  /// Constructs a [ServerException].
  const ServerException({required this.message, this.code, this.error});

  /// Human-readable error message.
  final String message;

  /// Optional error code (e.g., HTTP status).
  final Object? code;

  /// Additional error details from server response.
  final Map<String, dynamic>? error;
}

/// Exception thrown when a general server error occurs.
///
/// Example: an unexpected response or unhandled server-side issue.
class GeneralServerException extends ServerException {
  const GeneralServerException({
    required super.message,
    super.code,
    super.error,
  });

  @override
  String toString() => message;
}

/// Exception thrown when a server request times out.
///
/// Example: network delay, server not responding in time.
class TimeOutServerException extends ServerException {
  const TimeOutServerException({
    required super.message,
    super.code,
    super.error,
  });

  @override
  String toString() => message;
}

/// Exception thrown when a requested resource is not found (HTTP 404).
///
/// Example: API endpoint exists but data is missing.
class NotFoundServerException extends ServerException {
  const NotFoundServerException({
    required super.message,
    super.code,
    super.error,
  });

  @override
  String toString() => message;
}

/// Exception thrown when the server requires authentication (HTTP 401).
///
/// Example: missing or invalid access token.
class UnAuthenticationServerException extends ServerException {
  const UnAuthenticationServerException({
    required super.message,
    super.code,
    super.error,
  });

  @override
  String toString() => message;
}

/// Exception thrown when the server denies access (HTTP 403).
///
/// Example: user does not have permission to perform the action.
class UnAuthorizeServerException extends ServerException {
  const UnAuthorizeServerException({
    required super.message,
    super.code,
    super.error,
  });

  @override
  String toString() => message;
}

/// Exception thrown when an internal server error occurs (HTTP 500).
///
/// Example: unhandled exception in backend application.
class InternalServerException extends ServerException {
  const InternalServerException({
    required super.message,
    super.code,
    super.error,
  });

  @override
  String toString() => message;
}

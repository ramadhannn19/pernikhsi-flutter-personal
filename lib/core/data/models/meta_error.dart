/// Represents metadata about an error returned from an API response.
///
/// This model is typically used to capture error information
/// from backend responses with a `meta` wrapper structure.
///
/// Example JSON structure:
/// ```json
/// {
///   "meta": {
///     "code": 400,
///     "status": "Bad Request",
///     "message": "Invalid phone number"
///   },
///   "data": {
///     "field": "phone",
///     "error": "Must be a valid number"
///   }
/// }
/// ```
class MetaError {
  /// Numeric error code, typically HTTP status code or custom API code.
  ///
  /// Example: `400`, `401`, `500`.
  final int code;

  /// Status string describing the error type.
  ///
  /// Example: `"Bad Request"`, `"Unauthorized"`, `"Internal Server Error"`.
  final String? status;

  /// Human-readable error message.
  ///
  /// Example: `"Invalid phone number"`.
  final String? message;

  /// Additional error payload returned by the backend.
  ///
  /// Example: `{"field": "phone", "error": "Must be a valid number"}`.
  final Map<String, dynamic>? error;

  /// Constructs a [MetaError] instance.
  MetaError({required this.code, this.status, this.message, this.error});

  /// Creates a [MetaError] instance from JSON data.
  ///
  /// Expects the JSON structure to have a `meta` object and optionally a `data` object.
  /// Falls back to `500` if no code is provided.
  factory MetaError.fromJson(Map<String, dynamic> json) => MetaError(
    code: json['meta']['code'] ?? 500,
    status: json['meta']['status'],
    message: json['meta']['message'],
    error: json['data'] is Map ? json['data'] : null,
  );
}

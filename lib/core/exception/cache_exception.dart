/// Exception thrown when an issue related to cache occurs.
///
/// This is the base class for all cache-related exceptions in the app.
/// Extend this class when creating more specific cache exceptions.
class CacheException implements Exception {
  /// Constructs a [CacheException].
  ///
  /// [message] is a human-readable description of the error.
  /// [code] can optionally provide an error code (e.g., HTTP code or custom code).
  const CacheException({required this.message, this.code});

  /// Human-readable error message.
  final String message;

  /// Optional error code or identifier.
  final Object? code;

  @override
  String toString() => message;
}

/// Exception thrown when cache is empty or not found.
///
/// This typically occurs when trying to retrieve data that has not
/// been cached yet, or has already been cleared.
class NotFoundCacheException extends CacheException {
  /// Constructs a [NotFoundCacheException].
  const NotFoundCacheException({required super.message, super.code});

  @override
  String toString() => message;
}

/// Exception thrown when cache has expired.
///
/// This is used in combination with [ExpiryCacheDataSource] to indicate
/// that cached data is no longer valid and needs to be refreshed.
class ExpiredCacheException extends CacheException {
  /// Constructs an [ExpiredCacheException].
  const ExpiredCacheException({required super.message, super.code});

  @override
  String toString() => message;
}

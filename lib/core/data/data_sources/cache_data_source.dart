/// Interface/abstract class that defines methods for a caching data source.
///
/// This serves as a contract for cache implementations (e.g., Hive, SQLite,
/// SharedPreferences). The cache layer must implement this interface to ensure
/// a consistent API for saving, retrieving, checking, and clearing cached data.
abstract class CacheDataSource<T> {
  /// Saves data into the cache.
  ///
  /// Returns `true` if the operation succeeds, otherwise `false`.
  Future<bool> saveCache(T data);

  /// Retrieves the main cached data from local storage.
  ///
  /// Throws an error if no data is cached or retrieval fails.
  Future<T> getData();

  /// Checks whether data is currently cached.
  ///
  /// Returns `true` if cache exists, otherwise `false`.
  Future<bool> isCached();

  /// Clears all cached data from storage.
  ///
  /// Returns `true` if the cache was successfully cleared.
  Future<bool> clearCache();

  /// A unique identifier for the cache entry.
  ///
  /// Implementations must ensure this key is unique to avoid collisions.
  late String cacheKey;
}

/// Interface/abstract class that defines methods for cache expiry handling.
///
/// This is an optional extension for caches that need
/// time-based expiration logic.
abstract class ExpiryCacheDataSource {
  /// Determines whether the cached data is expired.
  ///
  /// Returns `true` if expired, otherwise `false`.
  Future<bool> isExpired();

  /// Sets the expiration date for the cache.
  ///
  /// Returns `true` if the expiration date was successfully set.
  Future<bool> setExpired(DateTime date);
}

import 'package:dio/dio.dart';

/// A Dio interceptor for handling authentication-related logic.
///
/// This class can be used to:
/// - Attach authentication headers (e.g., `Authorization: Bearer <token>`)
/// - Handle token refresh flows before sending requests
/// - Add custom headers required for secured API calls
///
/// Currently, this implementation is a placeholder that injects
/// an empty headers map. You can extend it to include JWT tokens,
/// API keys, or other authentication strategies.
///
/// Example usage:
/// ```dart
/// final dio = Dio()
///   ..interceptors.add(AuthHttpInterceptor());
///
/// // All requests sent via Dio will pass through this interceptor
/// final response = await dio.get("/secure/data");
/// ```
class AuthHttpInterceptor extends InterceptorsWrapper {
  AuthHttpInterceptor();

  /// Called before the request is sent.
  ///
  /// Use this to add authentication or custom headers.
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final optionHeaders = <String, Object>{
      // Example: "Authorization": "Bearer $token",
    };

    // Merge custom headers with existing ones
    options.headers.addAll(optionHeaders);

    // Continue request
    handler.next(options);
  }
}

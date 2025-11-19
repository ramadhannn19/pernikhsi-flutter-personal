import 'package:dio/dio.dart';
import 'package:pernikhsi/core/core.dart';

/// Extension for converting [DioException] into domain-specific [ServerException] types.
///
/// This provides a unified way of handling errors from Dio by mapping
/// HTTP status codes and Dio error types into strongly-typed exceptions.
///
/// Benefits:
/// - Consistent error handling across the app
/// - Easier UI state management (e.g., show "Unauthorized" message when 401)
/// - Centralized mapping of status codes to exception classes
///
/// Example:
/// ```dart
/// try {
///   final response = await dio.get("/users");
/// } on DioException catch (e) {
///   throw e.toServerException();
/// }
/// ```
extension DioErrorExtension on DioException {
  /// Converts a [DioException] into a specific [ServerException].
  ///
  /// - Parses the response body into a [MetaError]
  /// - Uses Dio's [type] and [response.statusCode] to determine which exception to throw
  /// - Returns the corresponding [ServerException] subtype
  ServerException toServerException() {
    final meta = MetaError.fromJson(response?.data ?? {});
    final message = meta.message;

    switch (type) {
      case DioExceptionType.badResponse:
        switch (response?.statusCode) {
          case 401:
            return UnAuthenticationServerException(
              message: message ?? 'Unauthorized',
              code: response?.statusCode,
            );
          case 403:
            return UnAuthorizeServerException(
              message: message ?? 'Forbidden',
              code: response?.statusCode,
            );
          case 404:
            return NotFoundServerException(
              message: message ?? 'Not found',
              code: response?.statusCode,
            );
          case 422:
            // Validation error with extra payload
            return NotFoundServerException(
              message: message ?? 'Not found',
              code: response?.statusCode,
              error: meta.error,
            );
          case 500:
          case 502:
            return InternalServerException(
              message: message ?? 'Internal server error',
              code: response?.statusCode,
            );
          default:
            return GeneralServerException(
              message:
                  message ?? '${response?.data ?? 'Internal server error'}',
              code: response?.statusCode,
            );
        }

      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return TimeOutServerException(
          message: message ?? 'Connection timeout',
          code: response?.statusCode,
        );

      case DioExceptionType.cancel:
      case DioExceptionType.badCertificate:
      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
        return GeneralServerException(
          message: message ?? 'A Server Error Occurred',
          code: response?.statusCode,
        );
    }
  }
}

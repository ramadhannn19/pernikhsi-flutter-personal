import 'package:dio/dio.dart';
import 'package:pernikhsi/core/core.dart';

/// Abstract contract for the Auth feature's API data source.
///
/// Defines methods that interact with remote endpoints for the Auth module.
/// Each method should correspond to an API call and return strongly typed data.
///
/// This separation allows:
/// - Easy mocking for tests
/// - Clear dependency boundaries (repository depends on data source)
/// - Consistent error handling via `ServerException`
abstract class AuthApiDataSource {
  /// Example API call.
  ///
  /// Returns `true` if the request succeeds (HTTP 200), otherwise throws [ServerException].
  Future<bool> example();
}

/// Implementation of [AuthApiDataSource] using [Dio].
///
/// Handles actual HTTP requests and maps errors into domain-specific exceptions.
///
/// Example usage:
/// ```dart
/// final dio = Dio(BaseOptions(baseUrl: "https://api.example.com"));
/// final dataSource = AuthApiDataSourceImpl(dio);
///
/// try {
///   final success = await dataSource.example();
///   print("Request success: $success");
/// } on ServerException catch (e) {
///   print("API failed: ${e.message}");
/// }
/// ```
class AuthApiDataSourceImpl implements AuthApiDataSource {
  /// Creates a new instance of [AuthApiDataSourceImpl] with a [Dio] client.
  AuthApiDataSourceImpl(this.dio);

  /// HTTP client for making API calls.
  final Dio dio;

  @override
  Future<bool> example() async {
    try {
      final response = await dio.get('/example');

      return response.statusCode == 200;
    } on DioException catch (e) {
      // Convert DioException into a domain-specific ServerException
      throw e.toServerException();
    } catch (e) {
      // Fallback for unexpected errors
      throw GeneralServerException(message: e.toString());
    }
  }
}

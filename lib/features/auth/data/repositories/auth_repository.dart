import 'package:dartz/dartz.dart';
import 'package:pernikhsi/core/core.dart';
import 'package:pernikhsi/features/auth/auth.dart';

/// Implementation of [AuthRepository] that connects the domain layer
/// with the data source.
///
/// Responsibilities:
/// - Delegates API calls to [AuthApiDataSource]
/// - Maps exceptions from the data layer into [Failure] objects
///   so that the domain layer deals only with safe, typed errors
///
/// Example flow:
/// ```dart
/// final repository = AuthRepositoryImpl(apiDataSource);
/// final result = await repository.example();
///
/// result.fold(
///   (failure) => print("Error: ${failure.message}"),
///   (success) => print("Request success: $success"),
/// );
/// ```
class AuthRepositoryImpl implements AuthRepository {
  /// Creates a [AuthRepositoryImpl] with the provided [AuthApiDataSource].
  AuthRepositoryImpl(this.api);

  /// The API data source implementation (e.g., [AuthApiDataSourceImpl]).
  final AuthApiDataSource api;

  @override
  Future<Either<Failure, bool>> example() async {
    try {
      // Call API through datasource
      final result = await api.example();

      // Wrap result in Right (success)
      return Right(result);
    } on ServerException catch (e) {
      // Map ServerException into domain-level Failure
      return Left(ServerFailure(message: e.message, code: e.code));
    }
  }
}

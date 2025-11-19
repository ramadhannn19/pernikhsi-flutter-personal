import 'package:dartz/dartz.dart';
import 'package:pernikhsi/core/core.dart';
import 'package:pernikhsi/features/home/home.dart';

/// Implementation of [HomeRepository] that connects the domain layer
/// with the data source.
///
/// Responsibilities:
/// - Delegates API calls to [HomeApiDataSource]
/// - Maps exceptions from the data layer into [Failure] objects
///   so that the domain layer deals only with safe, typed errors
///
/// Example flow:
/// ```dart
/// final repository = HomeRepositoryImpl(apiDataSource);
/// final result = await repository.example();
///
/// result.fold(
///   (failure) => print("Error: ${failure.message}"),
///   (success) => print("Request success: $success"),
/// );
/// ```
class HomeRepositoryImpl implements HomeRepository {
  /// Creates a [HomeRepositoryImpl] with the provided [HomeApiDataSource].
  HomeRepositoryImpl(this.api);

  /// The API data source implementation (e.g., [HomeApiDataSourceImpl]).
  final HomeApiDataSource api;

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

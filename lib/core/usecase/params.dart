import 'package:equatable/equatable.dart';

/// Represents an empty params object.
///
/// Use this class when you want to pass a `Params` type to a [UseCase]
/// that does not require any parameters.
///
/// Example:
/// ```dart
/// class GetAppConfigUseCase extends UseCaseFuture<Failure, Config, NoParams> {
///   @override
///   Future<Either<Failure, Config>> call(NoParams params) async {
///     // no input needed
///   }
/// }
///
/// // Usage
/// await getAppConfigUseCase(const NoParams());
/// ```
class NoParams {
  const NoParams();
}

/// Parameters for handling **pagination** requests.
///
/// Typically used in use cases that fetch data with paging support,
/// such as infinite scroll or paginated API calls.
///
/// Example:
/// ```dart
/// final params = PaginateParams(page: 2, limit: 20);
/// await getArticlesUseCase(params);
/// ```
class PaginateParams extends Equatable {
  /// Constructs [PaginateParams] with a [page] number and [limit] per page.
  ///
  /// Defaults:
  /// - [page] → 1
  /// - [limit] → 15
  const PaginateParams({this.page = 1, this.limit = 15});

  /// The page number to request.
  final int page;

  /// The maximum number of items to load per page.
  final int limit;

  @override
  List<Object?> get props => [page, limit];
}

/// Parameters for **search with pagination**.
///
/// Combines a search [query] string with a [page] number
/// for paginated search results.
///
/// Example:
/// ```dart
/// final params = SearchParams(query: "flutter", page: 1);
/// await searchArticlesUseCase(params);
/// ```
class SearchParams extends Equatable {
  /// Constructs [SearchParams] with [query] and [page].
  const SearchParams({required this.query, required this.page});

  /// Search keyword or phrase.
  final String query;

  /// Page number for pagination.
  final int page;

  @override
  List<Object> get props => [query, page];
}

/// Parameters for handling **date range queries**.
///
/// Useful when filtering data between a [start] and [end] date.
///
/// Example:
/// ```dart
/// final params = DateParams(start: "2025-01-01", end: "2025-01-31");
/// await getReportsUseCase(params);
/// ```
class DateParams extends Equatable {
  /// Constructs [DateParams] with a [start] and [end] date.
  const DateParams({required this.start, required this.end});

  /// The start date in string format (e.g., `"2025-01-01"`).
  final String start;

  /// The end date in string format (e.g., `"2025-01-31"`).
  final String end;

  @override
  List<Object> get props => [start, end];
}

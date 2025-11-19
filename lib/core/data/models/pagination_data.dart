import 'package:pernikhsi/core/core.dart';

/// A generic model class representing paginated data.
///
/// This is commonly used when consuming paginated API responses,
/// where results are split across multiple pages.
///
/// Fields include:
/// - [lastPage] → the total number of pages available
/// - [currentPage] → the page number currently being viewed
/// - [data] → the list of data items for the current page
///
/// Example JSON structure:
/// ```json
/// {
///   "current_page": 1,
///   "last_page": 5,
///   "data": [
///     { "id": 1, "title": "Item 1" },
///     { "id": 2, "title": "Item 2" }
///   ]
/// }
/// ```
///
/// Example usage with a custom model:
/// ```dart
/// final json = response.data;
/// final items = (json['data'] as List)
///     .map((e) => MyModel.fromJson(e))
///     .toList();
///
/// final pagination = PaginationData<MyModel>.fromJson(json, items);
/// ```
class PaginationData<T> {
  /// The last page number available from the API.
  final int lastPage;

  /// The current page number.
  final int currentPage;

  /// The list of data items for the current page.
  final List<T> data;

  /// Constructs a [PaginationData].
  PaginationData({
    required this.lastPage,
    required this.currentPage,
    required this.data,
  });

  /// Creates a [PaginationData] instance from JSON data.
  ///
  /// The [datas] parameter should be a parsed list of items,
  /// typically created by mapping over `json['data']`.
  factory PaginationData.fromJson(Map<String, dynamic> json, List<T> datas) {
    return PaginationData(
      data: datas,
      currentPage: NumParser.intParse(json['current_page']),
      lastPage: NumParser.intParse(json['last_page']),
    );
  }
}

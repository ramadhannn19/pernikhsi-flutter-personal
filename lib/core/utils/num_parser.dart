/// Utility class for safely parsing numeric values from dynamic input.
///
/// The [NumParser] provides helper methods for converting
/// `dynamic` values (from APIs, user input, etc.) into
/// [int] or [double] safely, with optional fallback values.
///
/// This prevents exceptions when parsing invalid input.
///
/// ## Features
/// - Convert `String`, `int`, `double`, or `num` into [int] or [double]
/// - Return `null` or a [fallbackValue] when parsing fails
/// - Special handling for `List`: `intParse(list)` returns its length
///
/// ## Examples
/// ```dart
/// NumParser.intParse('12');         // → 12
/// NumParser.intParse(12);           // → 12
/// NumParser.intParse(12.5);         // → 12
/// NumParser.intParse(null);         // → 0 (default fallback)
/// NumParser.intParse('abc', 100);   // → 100 (fallback)
///
/// NumParser.doubleParse('12');      // → 12.0
/// NumParser.doubleParse(12);        // → 12.0
/// NumParser.doubleParse(12.34);     // → 12.34
/// NumParser.doubleParse(null);      // → 0.0 (default fallback)
/// NumParser.doubleParse('oops', 5); // → 5.0 (fallback)
/// ```
class NumParser {
  /// Parse [int] from a dynamic [value].
  ///
  /// Supported cases:
  /// - If [value] is an `int`, returns it as is
  /// - If [value] is a `double`, converts to `int`
  /// - If [value] is a `String`, parses it to `int` if valid
  /// - If [value] is a `List`, returns its length
  ///
  /// Returns [fallbackValue] (default = 0) if parsing fails.
  static int intParse(dynamic value, {int fallbackValue = 0}) {
    if (value is List) {
      return value.length;
    } else {
      return tryIntParse(value) ?? fallbackValue;
    }
  }

  /// Try parsing [value] as an [int].
  ///
  /// Returns:
  /// - Parsed integer if successful
  /// - `null` if parsing fails
  static int? tryIntParse(dynamic value) {
    try {
      if (value is num) {
        return value.toInt();
      } else if (value is String) {
        return int.tryParse(value);
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  /// Parse [double] from a dynamic [value].
  ///
  /// Supported cases:
  /// - If [value] is a `double`, returns it as is
  /// - If [value] is an `int`, converts to `double`
  /// - If [value] is a `String`, parses it to `double` if valid
  ///
  /// Returns [fallbackValue] (default = 0.0) if parsing fails.
  static double doubleParse(dynamic value, {double fallbackValue = 0}) {
    return tryDoubleParse(value) ?? fallbackValue;
  }

  /// Try parsing [value] as a [double].
  ///
  /// Returns:
  /// - Parsed double if successful
  /// - `null` if parsing fails
  static double? tryDoubleParse(dynamic value) {
    try {
      if (value is num) {
        return value.toDouble();
      } else if (value is String) {
        return double.tryParse(value);
      }
      return null;
    } catch (_) {
      return null;
    }
  }
}

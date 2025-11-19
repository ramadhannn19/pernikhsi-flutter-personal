/// Utility class for safely parsing values into [String].
///
/// The [StringParser] provides helper methods for converting
/// `dynamic` values (from APIs, user input, etc.) into [String]
/// safely, with optional fallback values.
///
/// This prevents errors when handling nulls or non-string inputs.
///
/// ## Examples
/// ```dart
/// StringParser.parse("hello");             // → "hello"
/// StringParser.parse(123);                 // → "123"
/// StringParser.parse(null, fallbackValue: "-"); // → "-"
///
/// StringParser.tryParse("flutter");        // → "flutter"
/// StringParser.tryParse(42);               // → "42"
/// StringParser.tryParse(null);             // → null
/// ```
class StringParser {
  /// Parses a dynamic [value] into a [String].
  ///
  /// If parsing fails or [value] is `null`, returns [fallbackValue].
  /// Default [fallbackValue] = `''`.
  ///
  /// Example:
  /// ```dart
  /// StringParser.parse(123); // → "123"
  /// StringParser.parse(null, fallbackValue: "N/A"); // → "N/A"
  /// ```
  static String parse(dynamic value, {String fallbackValue = ''}) {
    return tryParse(value) ?? fallbackValue;
  }

  /// Attempts to parse a dynamic [value] into a [String].
  ///
  /// Returns:
  /// - The original value if it's already a [String]
  /// - `value.toString()` if it's not null
  /// - `null` if [value] is null
  ///
  /// Example:
  /// ```dart
  /// StringParser.tryParse("hi");   // → "hi"
  /// StringParser.tryParse(3.14);   // → "3.14"
  /// StringParser.tryParse(null);   // → null
  /// ```
  static String? tryParse(dynamic value) {
    if (value is String) {
      return value;
    } else if (value != null) {
      return value.toString();
    }
    return null;
  }
}

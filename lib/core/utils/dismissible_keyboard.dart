import 'package:flutter/material.dart';

/// A widget that dismisses the keyboard when tapping outside of a text field.
///
/// This is useful for forms or screens where the keyboard may remain open
/// and block UI elements after typing. Wrapping the page's content with
/// [DismissibleKeyboard] ensures the keyboard will automatically hide
/// when the user taps anywhere outside an active input field.
///
/// Example usage:
/// ```dart
/// @override
/// Widget build(BuildContext context) {
///   return DismissibleKeyboard(
///     child: Scaffold(
///       appBar: AppBar(title: const Text("Login")),
///       body: Padding(
///         padding: const EdgeInsets.all(16),
///         child: Column(
///           children: const [
///             TextField(),
///             SizedBox(height: 16),
///             TextField(),
///           ],
///         ),
///       ),
///     ),
///   );
/// }
/// ```
///
/// Behavior:
/// - Detects taps anywhere on the screen
/// - If the current focus is **not** on a text field, it will unfocus
/// - This triggers the soft keyboard to be dismissed
class DismissibleKeyboard extends StatelessWidget {
  /// Creates a [DismissibleKeyboard] that wraps around [child].
  const DismissibleKeyboard({super.key, this.child});

  /// The widget below this in the widget tree.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);

        // Dismiss the keyboard if the focus is not on a text field
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      behavior: HitTestBehavior
          .translucent, // ensures taps on empty space are detected
      child: child,
    );
  }
}

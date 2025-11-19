import 'package:pernikhsi/core/core.dart';
import 'package:flutter/material.dart';

/// A reusable search input field with a built-in clear button.
///
/// This widget extends [RegularInput] with search-specific behavior:
/// - Shows a search icon as prefix
/// - Adds a clear button (X) when text is not empty
/// - Supports callbacks for change, submit, tap, and clear
///
/// Typical use cases:
/// - Filtering lists or tables
/// - Searching content within a page
/// - Keyword input in forms
class SearchTextInput extends StatelessWidget {
  const SearchTextInput({
    super.key,
    required this.controller,
    this.hintText,
    this.onClear,
    this.onChanged,
    this.onSubmit,
    this.readOnly,
    this.onTap,
    this.focusNode,
    this.autoFocus,
    this.enable = true,
    this.suffixColor,
    this.suffix,
  });

  /// Text controller for managing the search query.
  final TextEditingController controller;

  /// Placeholder text shown when empty.
  final String? hintText;

  /// Callback triggered when the clear button is pressed.
  final VoidCallback? onClear;

  /// Callback when the query changes (on every keystroke).
  final ValueChanged<String>? onChanged;

  /// Callback when the user submits the search (keyboard action).
  final ValueChanged<String>? onSubmit;

  /// Whether the field is read-only.
  final bool? readOnly;

  /// Callback when the field is tapped.
  final VoidCallback? onTap;

  /// Focus node for external focus management.
  final FocusNode? focusNode;

  /// Whether the field should focus automatically when built.
  final bool? autoFocus;

  /// Whether the field is enabled.
  final bool enable;

  /// Custom color for the suffix (clear) icon.
  final Color? suffixColor;

  /// Additional suffix widget (placed after the clear button).
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return RegularInput(
      focusNode: focusNode,
      controller: controller,
      onChange: onChanged,
      onTap: onTap,
      readOnly: readOnly,
      autoFocus: autoFocus,
      onSubmit: onSubmit,
      enable: enable,
      inputAction: TextInputAction.search,
      // Add clear button + optional suffix
      suffix: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (controller.text.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.clear),
              color: suffixColor,
              onPressed: () {
                controller.clear();
                onClear?.call();
                onChanged?.call('');
              },
            ),
          if (suffix != null) suffix!,
        ],
      ),
      prefix: const Icon(Icons.search_rounded),
      hintText: hintText,
    );
  }
}

import 'package:pernikhsi/core/core.dart';
import 'package:flutter/material.dart';

/// A reusable bottom sheet container widget with adaptive padding
/// and a drag indicator.
///
/// This widget is commonly used with [showModalBottomSheet] to
/// display modal content in a consistent style across the app.
///
/// Features:
/// - Adds a top drag indicator (the gray rounded bar)
/// - Supports fixed height or expands with [Expanded]
/// - Automatically adjusts padding for the on-screen keyboard
/// - SafeArea wrapped to avoid system UI intrusions
///
/// Example usage:
/// ```dart
/// showModalBottomSheet(
///   context: context,
///   isScrollControlled: true,
///   builder: (_) => ContentSheet(
///     height: MediaQuery.of(context).size.height * 0.7,
///     content: MyFormWidget(),
///   ),
/// );
/// ```
class ContentSheet extends StatelessWidget {
  const ContentSheet({
    super.key,
    required this.content,
    this.height,
    this.expandContent = true,
  });

  /// The main widget to display inside the sheet.
  final Widget content;

  /// Optional fixed height for the sheet.
  ///
  /// If null, height will adjust based on [content] size.
  final double? height;

  /// Whether the [content] should expand to fill remaining space.
  ///
  /// - `true` → wraps [content] with [Expanded]
  /// - `false` → wraps [content] in a [SingleChildScrollView]
  final bool expandContent;

  @override
  Widget build(BuildContext context) {
    if (expandContent) {
      return AnimatedPadding(
        padding: MediaQuery.of(context).viewInsets,
        duration: const Duration(milliseconds: 100),
        child: SafeArea(
          child: SizedBox(
            height: height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildIndicator(context),
                Expanded(child: content),
              ],
            ),
          ),
        ),
      );
    } else {
      return AnimatedPadding(
        padding: MediaQuery.of(context).viewInsets,
        duration: const Duration(milliseconds: 100),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [_buildIndicator(context), content],
            ),
          ),
        ),
      );
    }
  }

  /// Builds the draggable indicator shown at the top of the sheet.
  ///
  /// This is a small rounded bar that signals to users that the
  /// sheet can be swiped or dragged.
  Widget _buildIndicator(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: Dimens.dp16),
          width: Dimens.dp42,
          height: Dimens.dp8,
          decoration: BoxDecoration(
            color: context.theme.dividerColor,
            borderRadius: BorderRadius.circular(Dimens.dp8),
          ),
        ),
      ],
    );
  }
}

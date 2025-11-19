import 'package:pernikhsi/core/core.dart';
import 'package:flutter/material.dart';

/// A reusable widget for displaying subtitle text with support
/// for theming and style customization.
///
/// By default, it uses the app's adaptive subtitle style
/// (`context.adaptive.subTitleTextStyle`) and allows optional
/// overrides such as custom styles, max lines, overflow handling,
/// and text alignment.
class SubTitleText extends StatelessWidget {
  /// Creates a [SubTitleText] widget.
  ///
  /// [text] is required and represents the content to display.
  const SubTitleText(
    this.text, {
    super.key,
    this.style,
    this.maxLine,
    this.overflow,
    this.align,
  });

  /// Factory constructor for a **light subtitle text** style.
  ///
  /// Applies a bold weight (`FontWeight.w700`) and merges it with
  /// any additional style provided.
  factory SubTitleText.light(
    String text, {
    Key? key,
    TextStyle? style,
    int? maxLine,
    TextOverflow? overflow,
    TextAlign? align,
  }) {
    return SubTitleText(
      text,
      key: key,
      style: const TextStyle(fontWeight: FontWeight.w700).merge(style),
      align: align,
      maxLine: maxLine,
      overflow: overflow,
    );
  }

  /// The text content to display.
  final String text;

  /// Additional custom text style to merge with the base subtitle style.
  final TextStyle? style;

  /// The maximum number of lines to display before truncating.
  final int? maxLine;

  /// How overflowing text should be handled (e.g., ellipsis).
  final TextOverflow? overflow;

  /// The alignment of the text within its container.
  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    // Retrieve the base subtitle style from the app's adaptive theme
    final baseStyle = context.adaptive.subTitleTextStyle;

    return Text(
      text,
      style: baseStyle?.merge(style),
      maxLines: maxLine,
      overflow: overflow,
      textAlign: align,
    );
  }
}

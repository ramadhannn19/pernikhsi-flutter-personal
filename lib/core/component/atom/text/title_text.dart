import 'package:pernikhsi/core/core.dart';
import 'package:flutter/material.dart';

/// A reusable widget for displaying title text with adaptive theming.
///
/// By default, it uses the app's adaptive title style
/// (`context.adaptive.titleTextStyle`) and applies a medium font weight
/// (`FontWeight.w500`). Optional parameters allow customization of style,
/// max line count, overflow behavior, and text alignment.
///
/// This widget is typically used for section titles or emphasis text
/// that stands out more than subtitles but is less prominent than headings.
class TitleText extends StatelessWidget {
  /// Creates a [TitleText] widget.
  ///
  /// [text] is required and represents the string content to render.
  const TitleText(
    this.text, {
    super.key,
    this.style,
    this.maxLine,
    this.overflow,
    this.align,
  });

  /// The text content to display.
  final String text;

  /// Additional custom text style to merge with the base title style.
  final TextStyle? style;

  /// The maximum number of lines to display before truncating.
  final int? maxLine;

  /// Defines how overflowing text should be handled (e.g., ellipsis).
  final TextOverflow? overflow;

  /// The alignment of the text within its container.
  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    // Retrieve the base title style from the adaptive theme
    // and enforce medium font weight for consistency.
    final baseStyle = context.adaptive.titleTextStyle?.copyWith(
      fontWeight: FontWeight.w500,
    );

    return Text(
      text,
      style: baseStyle?.merge(style),
      maxLines: maxLine,
      overflow: overflow,
      textAlign: align,
    );
  }
}

import 'package:pernikhsi/core/core.dart';
import 'package:flutter/material.dart';

/// A reusable text widget for displaying heading-style text
/// with support for customization and theming.
///
/// By default, it uses the app's adaptive heading text style
/// (defined in `context.adaptive.headingTextStyle`) and allows
/// optional overrides for style, max lines, overflow behavior,
/// and text alignment.
class HeadingText extends StatelessWidget {
  /// Creates a [HeadingText] widget.
  ///
  /// [text] is required and represents the string content to display.
  /// Optional parameters allow for styling and layout customization.
  const HeadingText(
    this.text, {
    super.key,
    this.style,
    this.maxLine,
    this.overflow,
    this.align,
  });

  /// The text content to display.
  final String text;

  /// An optional text style to merge with the base heading style.
  final TextStyle? style;

  /// The maximum number of lines to display before truncating.
  final int? maxLine;

  /// Determines how overflowing text should be handled.
  final TextOverflow? overflow;

  /// Alignment of the text within its container.
  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    // Retrieve the base heading style from the app's adaptive theme
    final baseStyle = context.adaptive.headingTextStyle;

    return Text(
      text,
      style: baseStyle?.merge(style),
      maxLines: maxLine,
      overflow: overflow,
      textAlign: align,
    );
  }
}

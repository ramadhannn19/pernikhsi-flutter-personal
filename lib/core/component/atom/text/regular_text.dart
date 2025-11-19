import 'package:pernikhsi/core/core.dart';
import 'package:flutter/material.dart';

/// A reusable text widget for displaying regular-style text with
/// multiple factory constructors for different weights and styles.
///
/// By default, it uses the app's adaptive regular text style
/// (`context.adaptive.regularTextStyle`), but you can override
/// font size, weight, color, and other properties through parameters.
class RegularText extends StatelessWidget {
  /// Creates a [RegularText] widget.
  ///
  /// [text] is required and represents the string content to display.
  /// Optional parameters allow customization of style, alignment,
  /// max line count, and overflow behavior.
  const RegularText(
    this.text, {
    super.key,
    this.style,
    this.maxLine,
    this.overflow,
    this.align,
  });

  /// Factory constructor for **large text** with a fixed font size (16dp)
  /// and normal weight.
  factory RegularText.large(
    BuildContext context,
    String text, {
    Key? key,
    TextStyle? style,
    int? maxLine,
    TextOverflow? overflow,
    TextAlign? align,
  }) {
    return RegularText(
      text,
      key: key,
      style: TextStyle(
        fontWeight: FontWeight.normal,
        color: context.adaptive.solidTextColor,
        fontSize: Dimens.dp16,
      ).merge(style),
      align: align,
      maxLine: maxLine,
      overflow: overflow,
    );
  }

  /// Factory constructor for **normal weight text**
  /// with solid (non-faded) text color.
  factory RegularText.normalSolid(
    BuildContext context,
    String text, {
    Key? key,
    TextStyle? style,
    int? maxLine,
    TextOverflow? overflow,
    TextAlign? align,
  }) {
    return RegularText(
      text,
      key: key,
      style: TextStyle(
        fontWeight: FontWeight.normal,
        color: context.adaptive.solidTextColor,
      ).merge(style),
      align: align,
      maxLine: maxLine,
      overflow: overflow,
    );
  }

  /// Factory constructor for **medium weight text** (FontWeight.w500)
  /// with solid text color.
  factory RegularText.mediumSolid(
    BuildContext context,
    String text, {
    Key? key,
    TextStyle? style,
    int? maxLine,
    TextOverflow? overflow,
    TextAlign? align,
  }) {
    return RegularText(
      text,
      key: key,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        color: context.adaptive.solidTextColor,
      ).merge(style),
      align: align,
      maxLine: maxLine,
      overflow: overflow,
    );
  }

  /// Factory constructor for **semi-bold text** (FontWeight.w600)
  /// with solid text color.
  factory RegularText.semiboldSolid(
    BuildContext context,
    String text, {
    Key? key,
    TextStyle? style,
    int? maxLine,
    TextOverflow? overflow,
    TextAlign? align,
  }) {
    return RegularText(
      text,
      key: key,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        color: context.adaptive.solidTextColor,
      ).merge(style),
      align: align,
      maxLine: maxLine,
      overflow: overflow,
    );
  }

  /// The text content to render.
  final String text;

  /// Additional custom text style to merge with the base style.
  final TextStyle? style;

  /// The maximum number of lines to display before truncating.
  final int? maxLine;

  /// How overflowing text should be handled.
  final TextOverflow? overflow;

  /// The alignment of the text within its container.
  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    // Retrieve the base regular style from the app's adaptive theme
    final baseStyle = context.adaptive.regularTextStyle;

    return Text(
      text,
      style: baseStyle?.merge(style),
      maxLines: maxLine,
      overflow: overflow,
      textAlign: align,
    );
  }
}

import 'package:pernikhsi/core/core.dart';
import 'package:flutter/material.dart';

/// A reusable widget for rendering form field labels with
/// optional required indicator (*) and description text.
///
/// Features:
/// - Displays a label in medium solid style
/// - Shows a red asterisk if [isRequired] is true
/// - Optionally displays a description aligned to the right
///
/// Typical usage: placed above form fields like [RegularInput],
/// [PasswordInput], or [PhoneTextInput].
///
/// Example:
/// ```dart
/// InputLabel(
///   label: "Email Address",
///   isRequired: true,
///   desc: "We’ll never share your email.",
/// )
/// ```
class InputLabel extends StatelessWidget {
  const InputLabel({super.key, this.label, this.isRequired, this.desc});

  /// The main label text for the form field.
  final String? label;

  /// Whether the field is required.
  ///
  /// If true, a red asterisk (*) will be shown next to the label.
  final bool? isRequired;

  /// Optional description text, shown at the right side of the label row.
  final String? desc;

  @override
  Widget build(BuildContext context) {
    if (label == null) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            // Main label
            RegularText.mediumSolid(context, label ?? ''),

            // Required indicator
            if (isRequired == true)
              SubTitleText(
                '*',
                style: TextStyle(color: context.theme.colorScheme.error),
              ),

            // Optional description text (aligned to right)
            if (desc != null)
              Expanded(
                child: RegularText(
                  desc!,
                  align: TextAlign.end,
                  style: const TextStyle(fontSize: Dimens.dp12),
                ),
              ),
          ],
        ),
        Dimens.dp4.height,
      ],
    );
  }
}

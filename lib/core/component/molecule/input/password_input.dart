import 'package:pernikhsi/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A reusable password input field widget with built-in
/// show/hide toggle functionality.
///
/// This widget wraps a [RegularInput] and adds a suffix icon
/// that allows users to toggle the visibility of the password text.
///
/// Features:
/// - Configurable label, hint, error message
/// - Support for input formatters, max length, input type/action
/// - Toggleable obscure text (visibility on/off)
/// - Callbacks for change and submit
class PasswordInput extends StatefulWidget {
  const PasswordInput({
    super.key,
    this.controller,
    this.focusNode,
    this.hintText,
    this.label,
    this.errorText,
    this.inputFormatters,
    this.onChange,
    this.onSubmit,
    this.inputAction,
    this.style,
    this.inputType,
    this.maxLength,
    this.labelText,
  });

  /// Controller to manage the input text.
  final TextEditingController? controller;

  /// Optional [FocusNode] to control focus externally.
  final FocusNode? focusNode;

  /// Placeholder text shown when the field is empty.
  final String? hintText;

  /// Field label displayed above the input.
  final String? label, labelText;

  /// Error message displayed below the field.
  final String? errorText;

  /// List of formatters to constrain/format user input.
  final List<TextInputFormatter>? inputFormatters;

  /// Callback when the text value changes.
  final ValueChanged<String>? onChange;

  /// Callback when the user submits the field.
  final ValueChanged<String>? onSubmit;

  /// Keyboard action button (e.g., "done" or "next").
  final TextInputAction? inputAction;

  /// Custom text style for the input.
  final TextStyle? style;

  /// Keyboard type (default: [TextInputType.visiblePassword]).
  final TextInputType? inputType;

  /// Maximum allowed length of the input text.
  final int? maxLength;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  /// Tracks whether the password is currently visible or hidden.
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return RegularInput(
      labelText: widget.labelText,
      prefixIcon: Icons.lock,
      errorText: widget.errorText,
      controller: widget.controller,
      hintText: widget.hintText,
      label: widget.label,
      focusNode: widget.focusNode,
      inputAction: widget.inputAction,
      inputFormatters: widget.inputFormatters,
      onChange: widget.onChange,
      onSubmit: widget.onSubmit,
      style: widget.style,
      inputType: widget.inputType ?? TextInputType.visiblePassword,
      maxLength: widget.maxLength,
      // Obscure text unless toggled visible
      obscureText: !isVisible,
      // Add suffix icon for toggling visibility
      suffix: _buildSuffix(),
    );
  }

  /// Builds the suffix icon button to toggle password visibility.
  ///
  /// When tapped, switches between [Icons.visibility_rounded]
  /// and [Icons.visibility_off_rounded].
  Widget _buildSuffix() {
    return InkWell(
      onTap: () {
        setState(() {
          isVisible = !isVisible;
        });
      },
      borderRadius: BorderRadius.circular(Dimens.dp100),
      child: Icon(
        isVisible ? Icons.visibility_rounded : Icons.visibility_off_rounded,
        size: Dimens.dp22,
      ),
    );
  }
}

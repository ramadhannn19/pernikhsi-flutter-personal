import 'package:flutter/cupertino.dart';
import 'package:pernikhsi/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A highly reusable input field widget with adaptive styling and customization.
///
/// This widget is the **foundation** for other custom inputs like
/// [PasswordInput] and [PhoneTextInput].
///
/// Features:
/// - Supports label, description, error text, and required flag
/// - Customizable prefix/suffix icons or widgets
/// - Configurable obscure text, max length, min/max lines
/// - Input formatters, keyboard type, and text capitalization
/// - Full control over focus, read-only, auto-focus, and tap behavior
class RegularInput extends StatelessWidget {
  const RegularInput({
    this.obscureText = false,
    this.focusNode,
    this.hintText,
    this.suffix,
    this.prefixIcon,
    this.controller,
    this.background,
    this.errorText,
    this.minLine = 1,
    this.maxLine = 1,
    this.onChange,
    this.onSubmit,
    this.inputAction,
    this.style,
    this.inputType,
    this.enable = true,
    this.onTap,
    this.readOnly,
    this.inputFormatters,
    this.maxLength,
    this.autoFocus,
    this.label,
    this.prefix,
    this.isRequired,
    this.textColor,
    this.decoration,
    this.desc,
    this.labelText,
    this.textAlign = TextAlign.start,
    this.textCapitalization,
    this.validator,
    super.key,
  });

  /// Optional leading icon inside the input field.
  final IconData? prefixIcon;

  /// Whether the field is enabled.
  final bool enable;

  /// Whether to obscure text (e.g., for passwords).
  final bool? obscureText;

  /// Whether the field is read-only.
  final bool? readOnly;

  /// Controller to manage input text.
  final TextEditingController? controller;

  /// Focus node for external focus control.
  final FocusNode? focusNode;

  /// Placeholder text when field is empty.
  final String? hintText;

  /// Error message shown below the input.
  final String? errorText;

  /// Optional suffix widget (e.g., icon button).
  final Widget? suffix;

  /// Background color of the input field.
  final Color? background;

  /// Minimum and maximum lines for multi-line input.
  final int minLine, maxLine;

  /// Callbacks for text change and submit actions.
  final ValueChanged<String>? onChange, onSubmit;

  /// Keyboard action button (e.g., done, next).
  final TextInputAction? inputAction;

  /// Custom text style for the field.
  final TextStyle? style;

  /// Keyboard input type (text, number, email, etc.).
  final TextInputType? inputType;

  /// Callback when the field is tapped.
  final VoidCallback? onTap;

  /// List of formatters for restricting input.
  final List<TextInputFormatter>? inputFormatters;

  /// Maximum number of characters allowed.
  final int? maxLength;

  /// Whether to focus automatically when built.
  final bool? autoFocus;

  /// Optional label displayed above the input.
  final String? label;

  /// Custom prefix widget instead of [prefixIcon].
  final Widget? prefix;

  /// Whether the field is required (used in validation).
  final bool? isRequired;

  /// Custom text color.
  final Color? textColor;

  /// Custom decoration to override default [InputDecoration].
  final InputDecoration? decoration;

  /// Additional description text under the label.
  final String? desc;

  /// Alternative label text used by [InputDecoration.labelText].
  final String? labelText;

  /// Alignment of input text (default: start).
  final TextAlign textAlign;

  /// Rules for capitalizing input text.
  final TextCapitalization? textCapitalization;

  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final disabledColor = !enable ? context.theme.disabledColor : null;
    final solidColor = context.adaptive.solidTextColor;
    final disabled = context.theme.disabledColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Custom label widget with required flag and description
        InputLabel(label: label, isRequired: isRequired, desc: desc),

        Theme(
          data: context.theme.copyWith(
            iconTheme: const IconThemeData(size: Dimens.dp10),
            primaryColor: solidColor,
          ),
          child: TextFormField(
            focusNode: focusNode,
            controller: controller,
            obscureText: obscureText ?? false,
            minLines: minLine,
            maxLines: maxLine,
            maxLength: maxLength,
            textCapitalization: textCapitalization ?? TextCapitalization.none,
            onChanged: onChange,
            onFieldSubmitted: onSubmit,
            textInputAction: inputAction ?? TextInputAction.done,
            style:
                style ??
                context.theme.textTheme.bodyMedium?.copyWith(
                  color: disabledColor ?? textColor ?? solidColor,
                ),
            keyboardType: inputType,
            enabled: enable,
            cursorColor: context.theme.primaryColor,
            onTap: onTap,
            textAlign: textAlign,
            readOnly: readOnly ?? false,
            inputFormatters: inputFormatters,
            autofocus: autoFocus ?? false,
            selectionControls: CupertinoTextSelectionControls(),
            validator: validator,
            decoration:
                decoration ??
                InputDecoration(
                  prefixIcon: (prefix != null && prefixIcon == null)
                      ? prefix
                      : (prefixIcon != null
                            ? Icon(prefixIcon, size: Dimens.dp22)
                            : null),
                  counterText: '',
                  labelText: labelText,
                  alignLabelWithHint: true,
                  labelStyle: context.theme.textTheme.bodyMedium?.copyWith(
                    color: disabled,
                  ),
                  floatingLabelStyle: context.theme.textTheme.bodyMedium
                      ?.copyWith(color: solidColor),
                  hintText: hintText ?? '',
                  hintStyle: context.theme.textTheme.bodyMedium?.copyWith(
                    color: disabled,
                  ),
                  errorText: errorText,
                  errorMaxLines: 10,
                  suffixIcon: suffix,
                  suffixIconColor: solidColor,
                ),
          ),
        ),
      ],
    );
  }
}

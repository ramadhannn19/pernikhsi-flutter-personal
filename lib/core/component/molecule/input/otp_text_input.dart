import 'dart:async';

import 'package:pernikhsi/core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A custom OTP (One-Time Password) input widget.
///
/// This widget displays a row of text fields styled as PIN boxes,
/// automatically manages focus changes, obscures characters if needed,
/// validates input length, and supports animations for cursor and errors.
///
/// Common use cases:
/// - SMS/Email OTP verification
/// - PIN entry fields
///
/// Features:
/// - Configurable length (recommended 3–8)
/// - Obscure text with optional blinking character
/// - Autofill support (iOS/Android)
/// - Error animation (shake)
/// - Customizable style, alignment, and cursor
class OtpTextInput extends StatefulWidget {
  OtpTextInput({
    super.key,
    required this.length,
    this.obscureText = false,
    this.obscuringCharacter = '●',
    this.blinkWhenObscuring = false,
    this.blinkDuration = const Duration(milliseconds: 500),
    this.onChanged,
    this.onCompleted,
    this.onSubmitted,
    this.textStyle,
    this.backgroundColor,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.animationDuration = const Duration(milliseconds: 150),
    this.animationCurve = Curves.easeInOut,
    this.keyboardType = TextInputType.visiblePassword,
    this.autoFocus = false,
    this.focusNode,
    this.inputFormatters = const <TextInputFormatter>[],
    this.enabled = true,
    this.controller,
    this.autoDismissKeyboard = true,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction = TextInputAction.done,
    this.beforeTextPaste,
    this.onTap,
    this.keyboardAppearance,
    this.validator,
    this.onSaved,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.enablePinAutofill = true,
    this.showCursor = true,
    this.cursorColor,
    this.cursorWidth = 2,
    this.cursorHeight,
    this.errorText,
  }) : assert(
         obscuringCharacter.isNotEmpty,
         'obscuringCharacter cannot be empty',
       );

  /// Number of input cells (typically 3–8).
  final int length;

  /// Whether to obscure input characters (e.g., for passwords or OTP).
  final bool obscureText;

  /// Character used for obscuring text when [obscureText] is true.
  final String obscuringCharacter;

  /// Whether to briefly show the typed character before obscuring it.
  final bool blinkWhenObscuring;

  /// Duration of the blink effect when [blinkWhenObscuring] is enabled.
  final Duration blinkDuration;

  /// Callback for when input changes (called on every keystroke).
  final ValueChanged<String>? onChanged;

  /// Callback for when all fields are filled.
  final ValueChanged<String>? onCompleted;

  /// Callback for when user submits via keyboard action.
  final ValueChanged<String>? onSubmitted;

  /// Optional text style for customizing the field text.
  final TextStyle? textStyle;

  /// Background color of the entire input row.
  final Color? backgroundColor;

  /// Alignment of the PIN cells within the row.
  final MainAxisAlignment mainAxisAlignment;

  /// Animation duration for transitions (e.g., cursor blink, fade).
  final Duration animationDuration;

  /// Animation curve for transitions.
  final Curve animationCurve;

  /// Keyboard type for input (default: visible password).
  final TextInputType keyboardType;

  /// Whether the field should autofocus when built.
  final bool autoFocus;

  /// Optional [FocusNode] for external focus control.
  final FocusNode? focusNode;

  /// Input formatters applied to the hidden [TextFormField].
  final List<TextInputFormatter> inputFormatters;

  /// Whether the field is enabled.
  final bool enabled;

  /// Controller for manually setting or retrieving input text.
  final TextEditingController? controller;

  /// Automatically dismiss keyboard when last cell is filled.
  final bool autoDismissKeyboard;

  /// Capitalization rules for text input.
  final TextCapitalization textCapitalization;

  /// Keyboard action button (e.g., "done" or "next").
  final TextInputAction textInputAction;

  /// Optional validator for the hidden [TextFormField].
  final FormFieldValidator<String>? validator;

  /// Called when the form is saved.
  final FormFieldSetter<String>? onSaved;

  /// Autovalidation mode for the hidden [TextFormField].
  final AutovalidateMode autovalidateMode;

  /// Enables OS-level OTP autofill.
  final bool enablePinAutofill;

  /// Whether to display a cursor in the active cell.
  final bool showCursor;

  /// Color of the cursor (default: theme primary color).
  final Color? cursorColor;

  /// Width of the cursor (default: 2).
  final double cursorWidth;

  /// Height of the cursor (default: font size + 8).
  final double? cursorHeight;

  /// Error message text displayed below the field.
  final String? errorText;

  /// Called before pasting text (to validate input).
  final bool Function(String? text)? beforeTextPaste;

  /// Called when the input row is tapped.
  final VoidCallback? onTap;

  /// Keyboard appearance (light/dark) on iOS.
  final Brightness? keyboardAppearance;

  @override
  State<OtpTextInput> createState() => _OtpTextInputState();
}

class _OtpTextInputState extends State<OtpTextInput>
    with TickerProviderStateMixin {
  late TextEditingController _textEditingController;
  late FocusNode _focusNode;
  late List<String> _inputList;

  int _selectedIndex = 0;
  BorderRadius borderRadius = BorderRadius.circular(Dimens.dp10);

  late bool _hasBlinked;
  late AnimationController _controller; // error animation
  late AnimationController _cursorController;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _cursorAnimation;
  Timer? _blinkDebounce;

  TextStyle? get _textStyle =>
      context.theme.textTheme.titleLarge?.merge(widget.textStyle);

  @override
  void initState() {
    _checkForInvalidValues();
    _assignController();

    // Focus node setup
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(() => setState(() {}));

    _inputList = List<String>.filled(widget.length, '');
    _hasBlinked = true;

    // Cursor blink animation
    _cursorController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _cursorAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(CurvedAnimation(parent: _cursorController, curve: Curves.easeIn));
    if (widget.showCursor) _cursorController.repeat();

    // Error shake animation
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(.1, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticIn));
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) _controller.reverse();
    });

    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _focusNode.dispose();
    _cursorController.dispose();
    _controller.dispose();
    super.dispose();
  }

  /// Ensure valid input values (e.g., length > 0).
  void _checkForInvalidValues() {
    assert(widget.length > 0, 'Length of the pin code cannot be zero');
  }

  /// Assigns or creates a [TextEditingController] and sets up listeners.
  void _assignController() {
    _textEditingController = widget.controller ?? TextEditingController();
    _textEditingController.addListener(() {
      _debounceBlink();
      var currentText = _textEditingController.text;

      if (widget.enabled && _inputList.join() != currentText) {
        if (currentText.length >= widget.length) {
          if (widget.onCompleted != null) {
            if (currentText.length > widget.length) {
              currentText = currentText.substring(0, widget.length);
            }
            Future.delayed(
              const Duration(milliseconds: 300),
              () => widget.onCompleted?.call(currentText),
            );
          }
          if (widget.autoDismissKeyboard) _focusNode.unfocus();
        }
        widget.onChanged?.call(currentText);
      }
      _setTextToInput(currentText);
    });
  }

  /// Controls the blink animation when obscuring characters.
  void _debounceBlink() {
    if (widget.blinkWhenObscuring &&
        _textEditingController.text.length >
            _inputList.where((x) => x.isNotEmpty).length) {
      setState(() => _hasBlinked = false);

      _blinkDebounce?.cancel();
      _blinkDebounce = Timer(widget.blinkDuration, () {
        setState(() => _hasBlinked = true);
      });
    }
  }

  /// Returns the correct border color for each field depending on state.
  Color _getColorFromIndex(int index) {
    if (widget.errorText != null) return context.theme.colorScheme.error;
    if (!widget.enabled) return context.adaptive.disabledColor;
    if (((_selectedIndex == index) ||
            (_selectedIndex == index + 1 && index + 1 == widget.length)) &&
        _focusNode.hasFocus) {
      return context.adaptive.primaryColor;
    }
    return context.theme.disabledColor.withValues(alpha: .1);
  }

  /// Renders the text/obscured character for each cell.
  Widget _renderPinField({required int index}) {
    final showObscured =
        !widget.blinkWhenObscuring ||
        (widget.blinkWhenObscuring && _hasBlinked) ||
        index != _inputList.where((x) => x.isNotEmpty).length - 1;

    return Text(
      widget.obscureText && _inputList[index].isNotEmpty && showObscured
          ? widget.obscuringCharacter
          : _inputList[index],
      key: ValueKey(_inputList[index]),
      style: _textStyle?.copyWith(color: context.theme.primaryColor),
    );
  }

  /// Builds each PIN cell, including cursor rendering if active.
  Widget buildChild(int index) {
    if (((_selectedIndex == index) ||
            (_selectedIndex == index + 1 && index + 1 == widget.length)) &&
        _focusNode.hasFocus &&
        widget.showCursor) {
      final cursorColor = widget.cursorColor ?? context.adaptive.primaryColor;
      final cursorHeight =
          widget.cursorHeight ?? (_textStyle?.fontSize ?? 0) + 8;

      if (_selectedIndex == index + 1 && index + 1 == widget.length) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                  left: (_textStyle?.fontSize ?? 1) / 1.5,
                ),
                child: FadeTransition(
                  opacity: _cursorAnimation,
                  child: CustomPaint(
                    size: Size(0, cursorHeight),
                    painter: _CursorPainter(
                      cursorColor: cursorColor,
                      cursorWidth: widget.cursorWidth,
                    ),
                  ),
                ),
              ),
            ),
            _renderPinField(index: index),
          ],
        );
      } else {
        return Center(
          child: FadeTransition(
            opacity: _cursorAnimation,
            child: CustomPaint(
              size: Size(0, cursorHeight),
              painter: _CursorPainter(
                cursorColor: cursorColor,
                cursorWidth: widget.cursorWidth,
              ),
            ),
          ),
        );
      }
    }
    return _renderPinField(index: index);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SlideTransition(
          position: _offsetAnimation,
          child: Container(
            height: 52,
            color: widget.backgroundColor,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                // Hidden text field that drives input logic
                AbsorbPointer(
                  child: AutofillGroup(
                    child: TextFormField(
                      textInputAction: widget.textInputAction,
                      controller: _textEditingController,
                      focusNode: _focusNode,
                      enabled: widget.enabled,
                      autofillHints: widget.enablePinAutofill && widget.enabled
                          ? <String>[AutofillHints.oneTimeCode]
                          : null,
                      autofocus: widget.autoFocus,
                      autocorrect: false,
                      keyboardType: widget.keyboardType,
                      keyboardAppearance: widget.keyboardAppearance,
                      textCapitalization: widget.textCapitalization,
                      validator: widget.validator,
                      onSaved: widget.onSaved,
                      autovalidateMode: widget.autovalidateMode,
                      inputFormatters: [
                        ...widget.inputFormatters,
                        LengthLimitingTextInputFormatter(widget.length),
                      ],
                      onFieldSubmitted: widget.onSubmitted,
                      enableInteractiveSelection: false,
                      showCursor: false,
                      cursorWidth: 0.01,
                      decoration: InputDecoration(border: InputBorder.none),
                      style: const TextStyle(
                        color: Colors.transparent,
                        height: .01,
                        fontSize: kIsWeb ? 1 : 0.01,
                      ),
                    ),
                  ),
                ),
                // Gesture area + visible custom fields
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      widget.onTap?.call();
                      _onFocus();
                    },
                    child: Row(
                      mainAxisAlignment: widget.mainAxisAlignment,
                      children: _generateFields(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (widget.errorText != null) _buildErrorText(),
      ],
    );
  }

  /// Generates the row of PIN cells with animations.
  List<Widget> _generateFields() {
    return List.generate(widget.length, (i) {
      return AnimatedContainer(
        curve: widget.animationCurve,
        duration: widget.animationDuration,
        width: 52,
        height: 52,
        decoration: BoxDecoration(
          color: context.theme.inputDecorationTheme.fillColor,
          borderRadius: borderRadius,
          border: Border.all(color: _getColorFromIndex(i)),
        ),
        child: Center(
          child: AnimatedSwitcher(
            duration: widget.animationDuration,
            switchInCurve: widget.animationCurve,
            switchOutCurve: widget.animationCurve,
            transitionBuilder: (child, animation) =>
                FadeTransition(opacity: animation, child: child),
            child: buildChild(i),
          ),
        ),
      );
    });
  }

  /// Ensures focus toggling works properly when tapped.
  void _onFocus() {
    if (_focusNode.hasFocus && MediaQuery.of(context).viewInsets.bottom == 0) {
      _focusNode.unfocus();
      Future.delayed(
        const Duration(microseconds: 1),
        () => _focusNode.requestFocus(),
      );
    } else {
      _focusNode.requestFocus();
    }
  }

  /// Updates [_inputList] and [_selectedIndex] with the new input.
  Future _setTextToInput(String data) async {
    final replaceInputList = List<String>.filled(widget.length, '');
    for (var i = 0; i < widget.length; i++) {
      replaceInputList[i] = data.length > i ? data[i] : '';
    }
    if (mounted) {
      setState(() {
        _selectedIndex = data.length;
        _inputList = replaceInputList;
      });
    }
  }

  /// Renders error text below the field if [errorText] is set.
  Widget _buildErrorText() {
    return Padding(
      padding: const EdgeInsets.only(top: Dimens.dp16),
      child: Text(
        widget.errorText!,
        style: TextStyle(
          fontSize: Dimens.dp10,
          color: context.theme.colorScheme.error,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

/// Shapes available for pin code fields.
enum PinCodeFieldShape { box, underline, circle }

/// Types of error animations supported.
enum ErrorAnimationType { shake }

/// Custom painter used to draw the blinking cursor.
class _CursorPainter extends CustomPainter {
  _CursorPainter({this.cursorColor = Colors.black, this.cursorWidth = 2});

  final Color cursorColor;
  final double cursorWidth;

  @override
  void paint(Canvas canvas, Size size) {
    const p1 = Offset.zero;
    final p2 = Offset(0, size.height);
    final paint = Paint()
      ..color = cursorColor
      ..strokeWidth = cursorWidth;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

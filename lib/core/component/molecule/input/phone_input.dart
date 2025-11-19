import 'package:pernikhsi/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A custom phone number input field with country picker support.
///
/// Features:
/// - Displays country flag and dial code as prefix
/// - Allows selecting country from bottom sheet with search
/// - Formats and validates phone number with country dial code
/// - Supports customization for label, hint, error text, suffix, etc.
class PhoneTextInput extends StatefulWidget {
  const PhoneTextInput({
    super.key,
    this.style,
    this.onChange,
    this.focusNode,
    this.inputAction,
    this.onSubmit,
    this.readOnly,
    this.hintText,
    this.errorText,
    this.suffix,
    this.label,
    this.isRequired,
    required this.controller,
  });

  /// Custom text style for the field.
  final TextStyle? style;

  /// Callback when the phone number changes.
  final ValueChanged<String>? onChange;

  /// Optional [FocusNode] for controlling focus externally.
  final FocusNode? focusNode;

  /// Keyboard action (e.g., "done", "next").
  final TextInputAction? inputAction;

  /// Callback when the user submits the field.
  final ValueChanged<String>? onSubmit;

  /// Whether the field is read-only.
  final bool? readOnly;

  /// Placeholder text shown when empty.
  final String? hintText;

  /// Error message shown below the input.
  final String? errorText;

  /// Optional widget to show as suffix (e.g., icon).
  final Widget? suffix;

  /// Label text displayed above the field.
  final String? label;

  /// Whether the field is required (for validation).
  final bool? isRequired;

  /// Controller for managing the phone number value.
  final TextEditingController controller;

  @override
  State<PhoneTextInput> createState() => _PhoneTextInputState();
}

class _PhoneTextInputState extends State<PhoneTextInput> {
  /// Currently selected country for dial code and flag.
  Country _currentCountry = CountriesData.data.first;

  /// Controller for the phone number portion (without dial code).
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    _initializeFormatPhone();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant PhoneTextInput oldWidget) {
    // Re-initialize formatting if controller value changes
    if (getCurrentValue() != oldWidget.controller.text.replaceAll('+', '')) {
      if (widget.controller.text.isEmpty) {
        _phoneController.text = '';
      }
      _initializeFormatPhone();
    }
    super.didUpdateWidget(oldWidget);
  }

  /// Initializes phone number formatting based on dial code.
  void _initializeFormatPhone() {
    var isFoundCountry = false;

    if (widget.controller.text.isNotEmpty) {
      for (final item in CountriesData.data) {
        final currentCountryCode = item.dialCode.replaceAll('+', '');
        final valueParam = widget.controller.text.replaceAll('+', '');

        if (valueParam.startsWith(currentCountryCode)) {
          if (valueParam != getCurrentValue()) {
            _currentCountry = item;
            _phoneController.text = valueParam.replaceFirst(
              currentCountryCode,
              '',
            );
            phoneNumberControllerListener();
            isFoundCountry = true;
          }
          break;
        }
      }

      if (!isFoundCountry) {
        _phoneController.text = int.tryParse(widget.controller.text).toString();
        phoneNumberControllerListener();
      }
    }
  }

  /// Syncs phone number value back to the main [widget.controller].
  void phoneNumberControllerListener() {
    if (mounted) {
      widget.onChange?.call(getCurrentValue());
      widget.controller.text = getCurrentValue();
    }
  }

  /// Returns full phone number with dial code.
  String getCurrentValue() {
    final number = int.tryParse(_phoneController.text);
    return (_currentCountry.dialCode).replaceFirst('+', '') +
        (number ?? '').toString();
  }

  @override
  Widget build(BuildContext context) {
    return RegularInput(
      label: widget.label,
      style: widget.style,
      onChange: (_) => phoneNumberControllerListener(),
      prefix: _buildPrefix(),
      focusNode: widget.focusNode,
      inputAction: widget.inputAction ?? TextInputAction.done,
      inputType: TextInputType.phone,
      onSubmit: widget.onSubmit,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      readOnly: widget.readOnly ?? false,
      controller: _phoneController,
      hintText: widget.hintText,
      suffix: widget.suffix ?? const Icon(Icons.phone),
      errorText: widget.errorText,
      isRequired: widget.isRequired,
    );
  }

  /// Builds the prefix widget showing country flag + dial code.
  Widget _buildPrefix() {
    return Container(
      height: Dimens.dp28,
      padding: const EdgeInsets.only(left: Dimens.defaultP),
      child: InkWell(
        onTap: (widget.readOnly ?? false) ? null : _showPickCountry,
        child: _buildItemCountry(_currentCountry),
      ),
    );
  }

  /// Builds the country selector item (flag + dial code).
  Widget _buildItemCountry(Country phone) {
    final disabled = context.theme.disabledColor;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(phone.flag, width: Dimens.dp28),
        Dimens.dp4.width,
        Icon(Icons.keyboard_arrow_down_rounded, color: disabled),
        Dimens.dp4.width,
        RegularText(
          phone.dialCode,
          style: context.theme.textTheme.bodyLarge?.copyWith(
            color: disabled,
            fontWeight: FontWeight.bold,
          ),
        ),
        Dimens.dp8.width,
      ],
    );
  }

  /// Updates the selected country and triggers change listener.
  void onCountryChanged(Country v) {
    setState(() => _currentCountry = v);
    phoneNumberControllerListener();
  }

  /// Opens a bottom sheet with a searchable country list.
  void _showPickCountry() {
    showModalBottomSheet<dynamic>(
      context: context,
      isScrollControlled: true,
      builder: (_) => ContentSheet(
        height: Dimens.height(context) * 0.8,
        content: _CountryList(key: widget.key, onChange: onCountryChanged),
      ),
    );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }
}

/// Bottom sheet widget for picking a country.
///
/// Includes search functionality by name or dial code.
class _CountryList extends StatefulWidget {
  const _CountryList({super.key, this.onChange});

  final ValueChanged<Country>? onChange;

  @override
  __CountryListState createState() => __CountryListState();
}

class __CountryListState extends State<_CountryList> {
  final TextEditingController _controller = TextEditingController();
  final List<Country> _searchData = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Search field
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.dp16),
          child: SearchTextInput(
            controller: _controller,
            hintText: 'Search...',
            onChanged: (value) => _onSearch(),
            onClear: () {
              _controller.clear();
              _onSearch();
            },
          ),
        ),
        // Country list
        if (_controller.text.isEmpty)
          _buildListCountry(CountriesData.data)
        else
          _buildListCountry(_searchData),
      ],
    );
  }

  /// Builds a scrollable list of countries.
  Widget _buildListCountry(List<Country> data) {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.all(Dimens.dp16),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, i) {
          return ListTile(
            onTap: () {
              widget.onChange?.call(data[i]);
              Navigator.of(context).pop();
            },
            leading: Image.asset(data[i].flag, width: Dimens.dp28),
            title: SubTitleText(data[i].name),
            trailing: RegularText(data[i].dialCode),
          );
        },
        separatorBuilder: (_, __) => const Divider(height: 0),
        itemCount: data.length,
      ),
    );
  }

  /// Filters countries based on search input.
  void _onSearch() {
    _searchData.clear();
    for (final item in CountriesData.data) {
      if (item.name.toLowerCase().contains(_controller.text.toLowerCase()) ||
          item.dialCode.contains(_controller.text)) {
        _searchData.add(item);
      }
    }
    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yeliz/config/palette.dart';

class CustomTextField extends StatefulWidget {
  final String? _initialValue;
  final String? _placeholder;
  final bool? _isEnabled;
  final bool? _autofocus;
  final Function(String value)? _onChanged;
  final Function(String value)? _onFieldSubmitted;
  final FormFieldValidator<String>? _validator;
  final List<TextInputFormatter>? _inputFormatters;
  final Iterable<String>? _autofillHints;
  final TextEditingController? _controller;
  final FocusNode? _focusNode;
  final TextInputType? _keyboardType;
  final TextInputAction? _textInputAction;
  final int? _maxLength;
  final int? _maxLines;
  final Widget? _prefix;
  final Widget? _suffix;
  final String? _hintText;
  final EdgeInsetsGeometry? _margin;
  final EdgeInsetsGeometry? _padding;
  final EdgeInsetsGeometry? _contentPadding;
  final BorderRadiusGeometry? _borderRadius;
  final bool? _obsecureText;
  final bool? _isAligned;

  const CustomTextField({
    Key? key,
    Function(String value)? onChanged,
    Function(String value)? onFieldSubmitted,
    String? initialValue,
    String? placeholder,
    bool isEnabled = true,
    bool autofocus = false,
    FormFieldValidator<String>? validator,
    List<TextInputFormatter>? inputFormatters,
    Iterable<String>? autofillHints,
    TextEditingController? controller,
    FocusNode? focusNode,
    TextInputType keyboardType = TextInputType.name,
    TextInputAction textInputAction = TextInputAction.next,
    int? maxLength,
    int? maxLines,
    Widget? prefix,
    Widget? suffix,
    EdgeInsetsGeometry margin = const EdgeInsets.symmetric(vertical: 5.0),
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    EdgeInsetsGeometry contentPadding = const EdgeInsets.fromLTRB(6, 6, 6, 6),
    BorderRadiusGeometry borderRadius = const BorderRadius.all(Radius.circular(5)),
    String? hintText,
    bool? obsecureText,
    bool? isAlinged,
  })  : _initialValue = initialValue,
        _placeholder = placeholder,
        _isEnabled = isEnabled,
        _autofocus = autofocus,
        _onChanged = onChanged,
        _onFieldSubmitted = onFieldSubmitted,
        _validator = validator,
        _prefix = prefix,
        _suffix = suffix,
        _inputFormatters = inputFormatters,
        _autofillHints = autofillHints,
        _controller = controller,
        _focusNode = focusNode,
        _keyboardType = keyboardType,
        _textInputAction = textInputAction,
        _maxLength = maxLength,
        _maxLines = maxLines,
        _margin = margin,
        _padding = padding,
        _contentPadding = contentPadding,
        _borderRadius = borderRadius,
        _hintText = hintText,
        _obsecureText = obsecureText,
        _isAligned = isAlinged,
        assert(onChanged != null || controller != null),
        super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget._margin,
      padding: widget._padding!.add((widget._maxLength != null || hasError) ? const EdgeInsets.only(bottom: 12.0) : EdgeInsets.zero),
      decoration: BoxDecoration(borderRadius: widget._borderRadius, color: Colors.grey.shade100, border: Border.all(color: Colors.grey.shade100)),
      child: TextFormField(
        textAlign: widget._isAligned != null ? (widget._isAligned == true ? TextAlign.center : TextAlign.start) : TextAlign.start,
        obscureText: widget._obsecureText ?? false,
        controller: widget._controller,
        focusNode: widget._focusNode,
        initialValue: widget._initialValue,
        enabled: widget._isEnabled,
        onFieldSubmitted: widget._onFieldSubmitted,
        onChanged: (value) {
          if (widget._onChanged != null) {
            widget._onChanged!(value);
            if (widget._validator != null) {
              setState(() {
                hasError = widget._validator!(value) != null;
              });
            }
          }
        },
        autofillHints: widget._autofillHints,
        autofocus: widget._autofocus!,
        validator: widget._validator,
        inputFormatters: widget._inputFormatters,
        keyboardType: widget._keyboardType,
        textInputAction: widget._textInputAction,
        maxLength: widget._maxLength,
        maxLines: widget._obsecureText == true ? 1 : widget._maxLines,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(fontSize: 15),
        decoration: InputDecoration(
          hintText: widget._hintText ?? "",
          hintStyle: TextStyle(fontSize: 18, color: Palette.hintTextColor),
          alignLabelWithHint: true,
          labelText: widget._placeholder,
          labelStyle: TextStyle(fontSize: 16, color: Palette.primaryColor),
          prefixIcon: widget._prefix == null
              ? null
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: widget._prefix,
                ),
          suffixIcon: widget._suffix == null
              ? null
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: widget._suffix,
                ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

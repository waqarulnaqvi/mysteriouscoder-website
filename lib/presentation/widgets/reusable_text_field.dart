import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mysteriouscoder/presentation/providers/theme_provider.dart';
import 'package:provider/provider.dart';


class ReusableTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isRequired;
  final int maxLines;
  final TextInputType keyboardType;
  final IconData? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;

  const ReusableTextField(
      {super.key,
        required this.controller,
        required this.hintText,
        this.isRequired = true,
        this.maxLines = 1,
        this.keyboardType = TextInputType.text,
        this.inputFormatters,
        this.prefixIcon});

  @override
  State<ReusableTextField> createState() => _ReusableTextFieldState();
}

class _ReusableTextFieldState extends State<ReusableTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _isHovering = false;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double alphaValue = (_isFocused || _isHovering) ? 1 : 0.5;
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: TextField(
        maxLines: widget.maxLines,
        controller: widget.controller,
        focusNode: _focusNode,
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatters,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          prefixIcon:
          widget.prefixIcon == null ? null : Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Icon(widget.prefixIcon, size: 25),
          ),
          hintText: "${widget.hintText}${widget.isRequired ? "*" : ""}",
          hintStyle: TextStyle(
            fontFamily: 'Poppins',
            color: Theme.of(context)
                .colorScheme
                .onSurface
                .withValues(alpha: 0.8),),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.onSurface, width: 1.5),
          ),
          fillColor: Theme.of(context)
              .colorScheme
              .surface
              .withValues(alpha: alphaValue),
          filled: true,
        ),
      ),
    );
  }
}

class ReusablePhoneTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isRequired;
  final int maxLines;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool disableLengthCheck;

  const ReusablePhoneTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.isRequired = true,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.disableLengthCheck = false,
  });

  @override
  State<ReusablePhoneTextField> createState() => _ReusablePhoneTextFieldState();
}

class _ReusablePhoneTextFieldState extends State<ReusablePhoneTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _isHovering = false;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var countryCode = Provider.of<ThemeProvider>(context, listen: false);
    double alphaValue = (_isFocused || _isHovering) ? 1 : 0.5;
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: IntlPhoneField(
        controller: widget.controller,
        disableLengthCheck: widget.disableLengthCheck,
        //by default it is false and if you want to disable the length check, you need to make it true
        focusNode: _focusNode,
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatters,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: "${widget.hintText}${widget.isRequired ? "*" : ""}",
          hintStyle: TextStyle(
              fontFamily: 'Poppins',
              color: Theme.of(context)
                  .colorScheme
                  .onSurface
                  .withValues(alpha: 0.8)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.onSurface, width: 1.5),
          ),
          fillColor: Theme.of(context)
              .colorScheme
              .surface
              .withValues(alpha: alphaValue),
          filled: true,
        ),
        initialCountryCode: 'IN',
        onChanged: (phone) {
          // widget.controller.text = phone.completeNumber;
          // widget.controller.selection = TextSelection.fromPosition(
          //   TextPosition(offset: widget.controller.text.length),
          // );
        },
        onCountryChanged: (country) {
          countryCode.countryCode = country.fullCountryCode;
        },
      ),
    );
  }
}

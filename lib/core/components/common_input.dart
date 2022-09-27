import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/styles.dart';

class CommonInput extends StatefulWidget {
  final String text;
  final InputType type;
  final bool isLabelTextOn;
  final TextEditingController? controller;
  final List<TextInputFormatter>? formatters;
  final Function? validator;
  final void Function(String value)? onChanged;
  final int? maxLines;
  final bool isSearch;
  final bool editable;
  final String? initialValue;
  final Color? customColor;
  final void Function(String value)? onSubmitted;
  final EdgeInsets? margin;
  double contentPaddingVertical;
  double borderRadius;
  FontWeight fontWeight;
  int borderAlpha;

  CommonInput(
    this.text, {
    this.type = InputType.TEXT,
    this.controller,
    this.isLabelTextOn = false,
    this.validator,
    this.formatters,
    this.onChanged,
    this.maxLines,
    this.initialValue,
    this.editable = true,
    this.customColor,
    this.onSubmitted,
    this.margin,
    this.isSearch = false,
    this.contentPaddingVertical = 18.0,
    this.borderRadius = 10,
    this.fontWeight = FontWeight.normal,
    this.borderAlpha = 255,
  });

  @override
  _CommonInputState createState() => _CommonInputState();
}

class _CommonInputState extends State<CommonInput> {
  bool _isTextNotObscured = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.isLabelTextOn
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    this.widget.text,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: widget.fontWeight,
                      color: widget.customColor == null
                          ? Styles.k_white_color
                          : widget.customColor,
                    ),
                  ),
                )
              : Container(),
          TextFormField(
            onFieldSubmitted: widget.onSubmitted,
            onChanged: widget.onChanged,
            controller: widget.controller,
            style: TextStyle(fontSize: 16, color: Styles.k_black),
            maxLines: widget.maxLines != null ? widget.maxLines : 1,
            inputFormatters: _getInputFormatters(),
            keyboardType: _getKeyBoardType(this.widget.type),
            obscuringCharacter: "*",
            obscureText: isPasswordInput() && !_isTextNotObscured,
            initialValue: widget.initialValue,
            enabled: widget.editable,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              suffixIcon: isPasswordInput()
                  ? GestureDetector(
                      onTap: () {
                        this._isTextNotObscured = !this._isTextNotObscured;
                        setState(() {});
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 0), // add padding to adjust icon
                        child: Icon(
                          _isTextNotObscured
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    )
                  : null,
              prefixIcon: widget.isSearch
                  ? Padding(
                      padding:
                          EdgeInsets.only(top: 0), // add padding to adjust icon
                      child: Icon(Icons.search),
                    )
                  : null,
              contentPadding: EdgeInsets.symmetric(
                  vertical: widget.contentPaddingVertical, horizontal: 20),
              hintText: this.widget.text,
              hintStyle: TextStyle(
                fontSize: 16,
                color: Styles.k_text_secondary_color,
              ),
              alignLabelWithHint: false,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Styles.k_white_color,
                ),
                borderRadius:
                    BorderRadius.all(Radius.circular(widget.borderRadius)),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
                borderRadius:
                    BorderRadius.all(Radius.circular(widget.borderRadius)),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
                borderRadius:
                    BorderRadius.all(Radius.circular(widget.borderRadius)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.customColor ?? Styles.k_text_primary_color,
                ),
                borderRadius:
                    BorderRadius.all(Radius.circular(widget.borderRadius)),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.customColor ?? Styles.k_text_primary_color,
                ),
                borderRadius:
                    BorderRadius.all(Radius.circular(widget.borderRadius)),
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        border: BorderDirectional(
          bottom: BorderSide(
              color: Color.fromARGB(widget.borderAlpha, 165, 189, 199),
              width: 0.8),
        ),
      ),
    );
  }

  List<TextInputFormatter> _getInputFormatters() {
    return widget.formatters ?? [];
  }

  bool isPasswordInput() {
    return widget.type == InputType.PASSWORD;
  }

  TextInputType _getKeyBoardType(InputType type) {
    TextInputType textType;

    switch (type) {
      case InputType.EMAIL:
        textType = TextInputType.emailAddress;
        break;
      case InputType.NUMBER:
        textType = TextInputType.numberWithOptions(decimal: true, signed: true);
        break;
      case InputType.NUMBER_WITH_OPTIONS:
        textType = TextInputType.numberWithOptions(decimal: true, signed: true);
        break;
      case InputType.PHONE:
        textType = TextInputType.number;
        break;
      default:
        textType = TextInputType.text;
    }

    return textType;
  }
}

enum InputType {
  TEXT,
  PASSWORD,
  EMAIL,
  NUMBER,
  NUMBER_WITH_OPTIONS,
  PHONE,
  TIME
}

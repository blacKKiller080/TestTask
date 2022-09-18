import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../constants/styles.dart';

class CommonInput extends StatelessWidget {
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
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isLabelTextOn
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    this.text,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: fontWeight,
                      color: customColor == null
                          ? Styles.k_white_color
                          : customColor,
                    ),
                  ),
                )
              : Container(),
          TextFormField(
            onFieldSubmitted: onSubmitted,
            onChanged: onChanged,
            controller: controller,
            // validator: validator,
            style: TextStyle(fontSize: 16, color: Styles.k_black),
            maxLines: maxLines != null ? maxLines : 1,
            inputFormatters: formatters,
            keyboardType: _getKyBoardType(this.type),
            obscuringCharacter: "*",
            obscureText: isPasswordInput(),
            initialValue: initialValue,
            enabled: editable,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              prefixIcon: isSearch
                  ? Padding(
                      padding:
                          EdgeInsets.only(top: 0), // add padding to adjust icon
                      child: Icon(Icons.search),
                    )
                  : null,
              contentPadding: EdgeInsets.symmetric(
                  vertical: contentPaddingVertical, horizontal: 20),
              hintText: this.text,
              hintStyle: TextStyle(
                fontSize: 16,
                color: Styles.k_text_secondary_color,
              ),
              alignLabelWithHint: false,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Styles.k_white_color,
                ),
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: customColor ?? Styles.k_text_primary_color,
                ),
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: customColor ?? Styles.k_text_primary_color,
                ),
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isPasswordInput() {
    return type == InputType.PASSWORD;
  }

  TextInputType _getKyBoardType(InputType type) {
    TextInputType textType;

    switch (type) {
      case InputType.EMAIL:
        textType = TextInputType.emailAddress;
        break;
      case InputType.NUMBER:
        textType = TextInputType.number;
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

enum InputType { TEXT, PASSWORD, EMAIL, NUMBER, PHONE, TIME }

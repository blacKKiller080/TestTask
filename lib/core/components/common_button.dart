import 'package:code_union/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CommonButton extends StatelessWidget {
  Widget child;
  Function? onPressed;
  bool success;
  bool disabled;
  EdgeInsets? margin;

  CommonButton(
      {required this.child,
      this.onPressed,
      this.success = false,
      this.disabled = false,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: 64,
      child: TextButton(
        onPressed: () {
          if (!disabled) this.onPressed?.call();
        },
        child: Container(
          child: Center(child: child),
          width: double.infinity,
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(getBackgroundColor()),
          foregroundColor: MaterialStateProperty.all(getForegroundColor()),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          textStyle: MaterialStateProperty.all(
            TextStyle(
              fontSize: 16,
            ),
          ),
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(
              vertical: 16,
            ),
          ),
        ),
      ),
    );
  }

  Color getBackgroundColor() {
    Color color;
    if (disabled) {
      color = Color.fromARGB(200, 70, 49, 210);
    } else {
      color = this.success
          ? Color.fromARGB(255, 70, 49, 210)
          : Color.fromARGB(150, 70, 49, 210);
    }
    return color;
  }

  Color getForegroundColor() {
    Color color;
    if (disabled) {
      color = Styles.k_text_tertiary_color;
    } else {
      color = this.success ? Styles.k_white_color : Styles.k_black_color;
    }
    return color;
  }
}

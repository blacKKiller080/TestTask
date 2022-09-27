import 'dart:developer';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InputHelper {
  static MaskTextInputFormatter phoneTextInputFormatter() {
    return MaskTextInputFormatter(
      mask: "+# (###) ###-##-##",
      filter: {
        "#": RegExp(r'[0-9]'),
      },
    );
  }

  static MaskTextInputFormatter dateTextInputFormatter() {
    return MaskTextInputFormatter(
      mask: "##.##.####",
      filter: {
        "#": RegExp(r'[0-9]'),
      },
    );
  }

  static MaskTextInputFormatter bankTextInputFormatter() {
    return MaskTextInputFormatter(
      mask: "#### #### #### ####",
      filter: {
        "#": RegExp(r'[0-9]'),
      },
    );
  }
}

import 'package:flutter/widgets.dart';

class MyAppColor {
  static Color primaryColor = Color(0xffC67C4E);
  static Color titleBlackText = Color(0xff242424);
  static Color subTitleText = Color(0xffA2A2A2);
  static Color iconBlack = Color(0xff2A2A2A);
  static Color dividerColor = Color(0xffF9F2ED);
}

class MyTextStyle {


  static TextStyle normalTitleText({Color? color, double? size}) {
    return TextStyle(
      fontSize: size ?? 16,
      color: color ?? MyAppColor.titleBlackText,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle smallTitleText({Color? color, double? size}) {
    return TextStyle(
      fontSize: size ?? 16,
      color: color ?? MyAppColor.titleBlackText,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle subTitleText({Color? color, double? size}) {
    return TextStyle(
      fontSize: size ?? 12,
      color: color ?? MyAppColor.subTitleText,
    );
  }
}

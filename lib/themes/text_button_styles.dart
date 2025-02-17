import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/web_color.dart';


class TextButtonStyles{
  static TextButtonThemeData getTextButtonStyle() => TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: WebColor.textButtonForegroundColor,
        textStyle: const TextStyle(
            color: WebColor.webPrimaryColor,
            fontSize: 16,
            fontFamily: "Poppins",
            fontWeight: FontWeight.bold
        ),
      )
  );
}
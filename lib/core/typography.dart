import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle heading(BuildContext context) => TextStyle(
    fontSize: MediaQuery.of(context).size.width * 0.07,
    fontWeight: FontWeight.bold,
  );

  static TextStyle body(BuildContext context) =>
      TextStyle(fontSize: MediaQuery.of(context).size.width * 0.045);
}

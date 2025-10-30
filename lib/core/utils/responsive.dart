import 'package:flutter/material.dart';

class Responsive {
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  static double blockWidth(BuildContext context, double percent) =>
      screenWidth(context) * percent / 100;
  static double blockheight(BuildContext context, double percent) =>
      screenHeight(context) * percent / 100;
}

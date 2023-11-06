import 'package:flutter/material.dart';

abstract class Widgets {
  static const loading = Center(child: CircularProgressIndicator());
  static const borderRadius = BorderRadius.all(Radius.circular(8));
  static const roundedRectangleBorder =
      RoundedRectangleBorder(borderRadius: borderRadius);
  static const spacingUnit = 16.0;
  static const listSeparator = SizedBox(height: 4);
  static const spacingVertical = SizedBox(height: 16);
  static const spacingHorizontal = SizedBox(width: 16);
  static const marginUnit = 16.0;
  static const marginAll = EdgeInsets.all(16);
  static const marginVertical = EdgeInsets.symmetric(vertical: 16);
  static const marginHorizontal = EdgeInsets.symmetric(horizontal: 16);
}

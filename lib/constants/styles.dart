import 'package:flutter/material.dart';

import 'widgets.dart';

abstract class Styles {
  static InputDecoration fieldDecoration({
    String? label,
    String? hint,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      border: const OutlineInputBorder(borderRadius: Widgets.borderRadius),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      hintText: hint,
      labelText: label,
      suffixIcon: suffixIcon,
    );
  }
}

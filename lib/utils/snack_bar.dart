import 'package:flutter/material.dart';

import '../config/router.dart';

void showSnackBar(String message, {Color? backgroundColor}) {
  ScaffoldMessenger.of(AppRouter.ctx).showSnackBar(
    SnackBar(content: Text(message), backgroundColor: backgroundColor),
  );
}

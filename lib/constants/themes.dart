import 'dart:ui';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Themes {
  static var _brightness = Brightness.dark;

  static Brightness get brightness => _brightness;

  static final _dark = ThemeData.dark();

  static final _light = ThemeData.light();

  static ThemeData get current =>
      _brightness == Brightness.dark ? _dark : _light;

  static Future<void> loadInitialTheme() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('is_dark_theme'))
      _brightness =
          prefs.getBool('is_dark_theme')! ? Brightness.dark : Brightness.light;
    else
      _brightness = PlatformDispatcher.instance.platformBrightness;
  }

  static Future<void> toggleTheme(BuildContext context) async {
    if (_brightness == Brightness.light) {
      ThemeSwitcher.of(context).changeTheme(theme: _dark);
      _brightness = Brightness.dark;
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('is_dark_theme', true);
    } else {
      ThemeSwitcher.of(context).changeTheme(theme: _light);
      _brightness = Brightness.light;
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('is_dark_theme', false);
    }
  }
}

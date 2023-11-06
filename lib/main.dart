import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'config/router.dart';
import 'constants/themes.dart';
import 'screens/error_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set error screen for release mode instead of the default grey screen
  if (kReleaseMode) ErrorWidget.builder = (_) => const ErrorScreen();

  // Load the initial theme before running the app
  await Themes.loadInitialTheme();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: Themes.current,
      builder: (_, theme) {
        return MaterialApp.router(
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          theme: theme,
          title: 'Phone Book',
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/error_screen.dart';
import '../screens/phone_list.dart';

abstract class AppRouter {
  static final _rootNavKey = GlobalKey<NavigatorState>(debugLabel: 'root');

  static final router = GoRouter(
    initialLocation: '/phone',
    debugLogDiagnostics: true,
    navigatorKey: _rootNavKey,
    errorBuilder: (_, __) => const ErrorScreen(),
    routes: [
      GoRoute(
        parentNavigatorKey: _rootNavKey,
        path: '/phone',
        name: (PhoneList).toString(),
        builder: (_, __) => const PhoneList(),
      ),
    ],
  );
}

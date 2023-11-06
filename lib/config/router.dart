import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/contact_add.dart';
import '../screens/error_screen.dart';
import '../screens/contact_list.dart';

abstract class AppRouter {
  static final _rootNavKey = GlobalKey<NavigatorState>(debugLabel: 'root');

  static BuildContext get ctx => _rootNavKey.currentContext!;

  static final router = GoRouter(
    initialLocation: '/contact',
    debugLogDiagnostics: true,
    navigatorKey: _rootNavKey,
    errorBuilder: (_, __) => const ErrorScreen(),
    routes: [
      GoRoute(
        parentNavigatorKey: _rootNavKey,
        path: '/contact',
        name: (ContactList).toString(),
        builder: (_, __) => const ContactList(),
        routes: [
          GoRoute(
            parentNavigatorKey: _rootNavKey,
            path: 'add',
            name: (ContactAdd).toString(),
            builder: (_, __) => const ContactAdd(),
          ),
        ],
      ),
    ],
  );
}

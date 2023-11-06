import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/contact_add.dart';
import '../screens/contact_info.dart';
import '../screens/error_screen.dart';
import '../screens/contact_list.dart';

abstract class AppRouter {
  static final _rootNavKey = GlobalKey<NavigatorState>(debugLabel: 'root');

  static BuildContext get ctx => _rootNavKey.currentContext!;

  static RouteMatchList get _currRoute {
    final lastMatch = router.routerDelegate.currentConfiguration.last;
    return lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : router.routerDelegate.currentConfiguration;
  }

  static Map<String, String> get pathParams => _currRoute.pathParameters;

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
          GoRoute(
            parentNavigatorKey: _rootNavKey,
            path: ':id',
            name: (ContactInfo).toString(),
            builder: (_, __) => const ContactInfo(),
          ),
        ],
      ),
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/widgets.dart';
import 'contact_list.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.warning, size: MediaQuery.of(context).size.width / 2),
            Text(
              'Something went wrong',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Widgets.spacingVertical,
            ElevatedButton(
              child: const Text('Go To Home'),
              onPressed: () => context.goNamed((ContactList).toString()),
            ),
          ],
        ),
      ),
    );
  }
}

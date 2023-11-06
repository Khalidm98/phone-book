import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phone_book/screens/phone_list.dart';

import '../constants/widgets.dart';

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
              onPressed: () => context.goNamed((PhoneList).toString()),
            ),
          ],
        ),
      ),
    );
  }
}

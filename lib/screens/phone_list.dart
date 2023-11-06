import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';

import '../constants/themes.dart';

class PhoneList extends StatefulWidget {
  const PhoneList({super.key});

  @override
  State<PhoneList> createState() => _PhoneListState();
}

class _PhoneListState extends State<PhoneList> {
  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Phone Book'),
          actions: [
            ThemeSwitcher(
              builder: (context) {
                return AnimatedCrossFade(
                  duration: const Duration(milliseconds: 200),
                  crossFadeState: Themes.brightness == Brightness.dark
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  firstChild: IconButton(
                    icon: const Icon(Icons.wb_sunny_outlined),
                    onPressed: () => Themes.toggleTheme(context),
                    tooltip: 'Light Mode',
                  ),
                  secondChild: IconButton(
                    icon: const Icon(Icons.nightlight_round),
                    onPressed: () => Themes.toggleTheme(context),
                    tooltip: 'Dark Mode',
                  ),
                );
              },
            )
          ],
        ),
        body: const Center(child: Text('Phones')),
      ),
    );
  }
}

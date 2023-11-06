import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';

import '../constants/themes.dart';
import '../providers/contact_data.dart';

class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  late final ContactData _data;

  @override
  void initState() {
    super.initState();
    _data = context.read<ContactData>();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Contact List'),
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
        body: ListView.separated(
          itemCount: _data.list.length,
          separatorBuilder: (_, __) => const Divider(height: 1, thickness: 1),
          itemBuilder: (_, index) {
            final contact = _data.list[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: contact.avatar == null
                    ? null
                    : NetworkImage(contact.avatar!),
                child: contact.avatar == null ? Text(contact.name![0]) : null,
              ),
              title: Text(contact.name!),
              subtitle: Text(contact.phone!),
            );
          },
        ),
      ),
    );
  }
}

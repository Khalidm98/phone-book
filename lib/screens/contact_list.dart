import 'dart:io';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/themes.dart';
import '../models/contact.dart';
import '../providers/contact_data.dart';
import 'contact_add.dart';
import 'contact_info.dart';

class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
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
        body: Selector<ContactData, List<Contact>>(
          selector: (_, data) => data.list,
          builder: (_, list, __) {
            return ListView.separated(
              itemCount: list.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, thickness: 1),
              itemBuilder: (_, index) {
                final contact = list[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: (contact.avatar == null
                        ? null
                        : contact.avatar!.startsWith('/')
                            ? FileImage(File(contact.avatar!))
                            : NetworkImage(contact.avatar!) as ImageProvider),
                    child:
                        contact.avatar == null ? Text(contact.name![0]) : null,
                  ),
                  title: Text(contact.name!),
                  subtitle: Text(contact.phone!),
                  onTap: () {
                    context.goNamed(
                      (ContactInfo).toString(),
                      pathParameters: {'id': contact.id!.toString()},
                    );
                  },
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.goNamed((ContactAdd).toString()),
          child: const Icon(Icons.add, size: 32),
        ),
      ),
    );
  }
}

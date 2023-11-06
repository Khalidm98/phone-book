import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/widgets.dart';
import '../models/contact.dart';
import '../providers/contact_data.dart';
import '../widgets/circle_image.dart';
import 'contact_edit.dart';
import 'error_screen.dart';

class ContactInfo extends StatefulWidget {
  const ContactInfo({super.key});

  @override
  State<ContactInfo> createState() => ContactInfoState();
}

class ContactInfoState extends State<ContactInfo> {
  late final ContactData _data;

  Contact get _obj => _data.obj!;

  @override
  void initState() {
    super.initState();
    _data = context.read<ContactData>();
    _data.getObj();
  }

  @override
  void dispose() {
    _data.obj = null;
    _data.objError = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final object = context.select((ContactData data) => data.obj);
    final error = context.select((ContactData data) => data.objError);

    if (error) return const ErrorScreen();

    if (object == null) return const Scaffold(body: Widgets.loading);

    return _scaffold;
  }

  Scaffold get _scaffold {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Info'),
        actions: [
          IconButton(
            tooltip: 'Delete',
            icon: const Icon(Icons.delete),
            onPressed: _showDeleteDialog,
          ),
        ],
      ),
      body: ListView(
        padding: Widgets.marginAll,
        children: [
          CircleImage(initialImage: _obj.avatar),
          Widgets.spacingVertical,
          Text(_obj.name!, textAlign: TextAlign.center, textScaleFactor: 1.2),
          Widgets.spacingVertical,
          Text(_obj.phone!, textAlign: TextAlign.center),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(
            (ContactEdit).toString(),
            pathParameters: {'id': _obj.id!.toString()},
          );
        },
        child: const Icon(Icons.edit),
        tooltip: 'Edit',
      ),
    );
  }

  void _showDeleteDialog() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Delete this contact?'),
          actions: [
            TextButton(
              onPressed: _delete,
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () => context.pop(),
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }

  void _delete() {
    context.pop();
    _data.delete();
    context.pop();
  }
}

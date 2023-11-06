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

  Contact get obj => _data.obj!;

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

    return scaffold;
  }

  Scaffold get scaffold {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Info'),
      ),
      body: ListView(
        padding: Widgets.marginAll,
        children: [
          CircleImage(initialImage: obj.avatar),
          Widgets.spacingVertical,
          Text(obj.name!, textAlign: TextAlign.center, textScaleFactor: 1.2),
          Widgets.spacingVertical,
          Text(obj.phone!, textAlign: TextAlign.center),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(
            (ContactEdit).toString(),
            pathParameters: {'id': obj.id!.toString()},
          );
        },
        child: const Icon(Icons.edit),
        tooltip: 'Edit',
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants/widgets.dart';
import '../models/contact.dart';
import '../providers/contact_data.dart';
import '../widgets/forms/image_pick.dart';
import '../widgets/forms/name_field.dart';
import '../widgets/forms/phone_field.dart';
import 'error_screen.dart';

class ContactEdit extends StatefulWidget {
  const ContactEdit({super.key});

  @override
  State<ContactEdit> createState() => ContactEditState();
}

class ContactEditState extends State<ContactEdit> {
  late final ContactData _data;
  final _formKey = GlobalKey<FormState>();

  Contact get _obj => _data.toBeEdited!;

  @override
  void initState() {
    super.initState();
    _data = context.read<ContactData>();
    _data.getEdit();
  }

  @override
  void dispose() {
    _data.toBeEdited = null;
    _data.editError = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final object = context.select((ContactData data) => data.toBeEdited);
    final error = context.select((ContactData data) => data.editError);

    if (error) return const ErrorScreen();

    if (object == null) return const Scaffold(body: Widgets.loading);

    return _scaffold;
  }

  Scaffold get _scaffold {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Contact')),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).unfocus(),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: Widgets.marginAll,
            children: [
              ImagePick(
                initialImage: _obj.avatar,
                onSaved: (val) => _obj.avatar = val?.path,
              ),
              Widgets.spacingVertical,
              NameField(
                initialValue: _obj.name,
                textInputAction: TextInputAction.next,
                onSaved: (val) => _obj.name = val,
              ),
              Widgets.spacingVertical,
              PhoneField(
                initialValue: _obj.phone,
                onSaved: (val) => _obj.phone = val,
              ),
              Widgets.spacingVertical,
              ElevatedButton(onPressed: _edit, child: const Text('Edit')),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _edit() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    final edited = await _data.edit();
    if (edited != null) context.pop();
  }
}

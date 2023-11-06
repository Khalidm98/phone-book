import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/widgets.dart';
import '../models/contact.dart';
import '../providers/contact_data.dart';
import '../widgets/forms/image_pick.dart';
import '../widgets/forms/name_field.dart';
import '../widgets/forms/phone_field.dart';

class ContactAdd extends StatefulWidget {
  const ContactAdd({super.key});

  @override
  State<ContactAdd> createState() => ContactAddState();
}

class ContactAddState extends State<ContactAdd> {
  late final ContactData _data;
  final _formKey = GlobalKey<FormState>();

  Contact get obj => _data.toBeAdded;

  @override
  void initState() {
    super.initState();
    _data = context.read<ContactData>();
  }

  @override
  void dispose() {
    _data.clearToBeAdded();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Contact')),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).unfocus(),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: Widgets.marginAll,
            children: [
              ImagePick(onSaved: (val) => obj.avatar = val?.path),
              Widgets.spacingVertical,
              NameField(
                textInputAction: TextInputAction.next,
                onSaved: (val) => obj.name = val,
              ),
              Widgets.spacingVertical,
              PhoneField(onSaved: (val) => obj.phone = val),
              Widgets.spacingVertical,
              ElevatedButton(onPressed: _add, child: const Text('Add')),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _add() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    final added = await _data.add();
    if (added != null) context.pop();
  }
}

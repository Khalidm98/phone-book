import 'package:flutter/material.dart';

import '../../../constants/validators.dart';
import '../../constants/styles.dart';

class NameField extends StatelessWidget {
  final String? initialValue;
  final TextInputAction? textInputAction;
  final FormFieldSetter<String>? onSaved;

  const NameField({
    super.key,
    this.initialValue,
    this.textInputAction,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: Styles.fieldDecoration(label: 'Name'),
      initialValue: initialValue,
      keyboardType: TextInputType.name,
      textInputAction: textInputAction,
      onSaved: onSaved,
      validator: Validators.name,
    );
  }
}

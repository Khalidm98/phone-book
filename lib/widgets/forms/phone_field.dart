import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants/styles.dart';
import '../../constants/validators.dart';

class PhoneField extends TextFormField {
  PhoneField({
    super.key,
    super.initialValue,
    super.textInputAction,
    FormFieldSetter<String>? onSaved,
  }) : super(
          decoration: Styles.fieldDecoration(
            label: 'Phone',
            suffixIcon: const Icon(Icons.call),
          ),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\+?\d*'))
          ],
          keyboardType: TextInputType.phone,
          onSaved: (val) => onSaved?.call(val == null
              ? null
              : val.startsWith('+') || val.isEmpty
                  ? val
                  : '+$val'),
          validator: Validators.phone,
        );
}

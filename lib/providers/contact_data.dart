import 'package:flutter/material.dart';

import '../models/contact.dart';
import '../utils/snack_bar.dart';

export 'package:provider/provider.dart';

class ContactData with ChangeNotifier {
  var list = [
    Contact(
      id: 1,
      name: 'Alice Johnson',
      phone: '+1234567890',
      avatar: 'https://picsum.photos/200/300',
    ),
    Contact(
      id: 2,
      name: 'Bob Smith',
      phone: '+0987654321',
      avatar: 'https://picsum.photos/200/300',
    ),
    Contact(
      id: 3,
      name: 'Charlie Brown',
      phone: '+1122334455',
      avatar: 'https://picsum.photos/200/300',
    ),
    Contact(
      id: 4,
      name: 'David Williams',
      phone: '+5566778899',
      avatar: 'https://picsum.photos/200/300',
    ),
    Contact(
      id: 5,
      name: 'Eva Green',
      phone: '+2244668800',
      avatar: 'https://picsum.photos/200/300',
    )
  ];

  Contact? _toBeAdded;

  Contact get toBeAdded => _toBeAdded ??= Contact();

  void clearToBeAdded() => _toBeAdded = null;

  Future<Contact?> add() async {
    toBeAdded.id = list.length;
    list = list.map((e) => e).toList();
    list.add(toBeAdded);
    showSnackBar('Contact added successfully');
    notifyListeners();
    clearToBeAdded();
    return list.last;
  }
}

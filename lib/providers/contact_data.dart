import 'package:flutter/material.dart';

import '../config/router.dart';
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
  Contact? obj;
  bool objError = false;
  Contact? toBeEdited;
  bool editError = false;

  Contact get toBeAdded => _toBeAdded ??= Contact();

  void clearToBeAdded() => _toBeAdded = null;

  Future<Contact?> add() async {
    toBeAdded.id = list.length + 1;
    list = list.map((e) => e).toList();
    list.add(toBeAdded);
    showSnackBar('Contact added successfully');
    notifyListeners();
    clearToBeAdded();
    return list.last;
  }

  Future<Contact?> edit() async {
    obj = Contact.fromJson(toBeEdited!.toJson());
    list = list.map((e) => e).toList();
    list[toBeEdited!.id! - 1] = toBeEdited!;
    showSnackBar('Contact edited successfully');
    notifyListeners();
    toBeEdited = null;
    return list.last;
  }

  Future<void> getObj() async {
    await Future.delayed(const Duration(milliseconds: 1));
    try {
      final object = list
          .singleWhere((e) => e.id.toString() == AppRouter.pathParams['id']);
      obj = Contact.fromJson(object.toJson());
    } catch (_) {
      objError = true;
    }
    notifyListeners();
  }

  Future<void> getEdit() async {
    await Future.delayed(const Duration(milliseconds: 1));
    try {
      final object = list
          .singleWhere((e) => e.id.toString() == AppRouter.pathParams['id']);
      toBeEdited = Contact.fromJson(object.toJson());
    } catch (_) {
      editError = true;
    }
    notifyListeners();
  }
}

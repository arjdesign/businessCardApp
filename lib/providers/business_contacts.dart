import 'dart:io';

import 'package:flutter/foundation.dart';

import '../models/business_card.dart';

class BusinessContacts with ChangeNotifier {
   final List<BusinessCard> _items = [];

  // getter and make sure cant be changed form outside.
  List<BusinessCard> get items {
    return [..._items];
  }

  void addCard(
    String pickedName,
    File pickedImage,
  ) {
    final newCard = BusinessCard(
      id: DateTime.now().toString(),
      image: pickedImage,
      name: pickedName,
    );
    _items.add(newCard);
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class Chart with ChangeNotifier{
  int _quantity = 0;

  int get quantity => _quantity;

  set quantity(int val) {
    _quantity = val;
    notifyListeners();
  }
}
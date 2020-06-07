import 'package:flutter/material.dart';

class Money with ChangeNotifier{
  int _balance = 1000;

  int get balance => _balance;

  set balance(int val) {
    _balance = val;
    notifyListeners();
  }
}
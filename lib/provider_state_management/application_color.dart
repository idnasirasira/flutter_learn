import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ApplicationColor with ChangeNotifier{
  bool _isRed = false;

  bool get isRed => _isRed;

  set isRed(bool val){
    _isRed = val;
    notifyListeners();
  }

  Color get color => (_isRed) ? Colors.red : Colors.blue;
}
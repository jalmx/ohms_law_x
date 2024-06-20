import 'package:flutter/material.dart';
import 'package:ohms_law/util/misc/units.dart';

class OhmModel extends ChangeNotifier {
  UnitType _operation = UnitType.W;
  bool _activatePower =false;

  num _valueFirst = 0.0;
  num _valueSecond = 0.0;

  String _suffixFirst = "V";
  String _suffixSecond = "Ω";

  set valueFirst(num value) {
    _valueFirst = value;
    notifyListeners();
  }

  set valueSecond(num value) {
    _valueSecond = value;
    notifyListeners();
  }

  num get valueFirst => _valueFirst;

  num get valueSecond => _valueSecond;

  set suffixFirst(String value) {
    _suffixFirst = value;
    notifyListeners();
  }

  set suffixSecond(String value) {
    _suffixSecond = value;
    notifyListeners();
  }

  String get suffixFirst => _suffixFirst;

  String get suffixSecond => _suffixSecond;

  UnitType get operation => _operation;

  set operation(UnitType value) {
    _operation = value;
    notifyListeners();
  }

  String get unitLetter => Unit.getUnitLetterString()[_operation]!;

  bool get isPower => _activatePower;

  set isPower(bool status) {
    _activatePower = status;
    notifyListeners();
  }
  
}

import 'package:flutter/material.dart';
import 'package:ohms_law/util/helpers/log.dart';
import 'package:ohms_law/util/misc/units.dart';
import 'package:ohms_law/util/ohms/current.dart';
import 'package:ohms_law/util/ohms/power.dart';
import 'package:ohms_law/util/ohms/resistance.dart';
import 'package:ohms_law/util/ohms/voltage.dart';

class OhmModel extends ChangeNotifier {
  UnitType _operation = UnitType.A;
  bool _activatePower = false;

  num _valueFirst = 0.0;
  num _valueSecond = 0.0;

  String _suffixFirst = "V";
  String _suffixSecond = "Ω";

  List<String> _listOptionsRowFirst = [
    "pV",
    "nV",
    "uV",
    "mV",
    "V",
    "kV",
    "MV",
    "GV"
  ];
  List<String> _listOptionsRowSecond = [
    "pΩ",
    "nΩ",
    "uΩ",
    "mΩ",
    "Ω",
    "kΩ",
    "MΩ",
    "GΩ"
  ];

  ResultValue _resultMini = ResultValue(valueRaw: 0);
  ResultValue _result = ResultValue(valueRaw: 0);

  set result(ResultValue value) {
    _result = value;
    notifyListeners();
  }

  ResultValue get result => _result;

  set resultMini(ResultValue value) {
    _resultMini = value;
    notifyListeners();
  }

  ResultValue get resultMini => _resultMini;

  set listOptionsFirst(List<String> options) {
    _listOptionsRowFirst = options;
    notifyListeners();
  }

  List<String> get listOptionsFirst => _listOptionsRowFirst;

  set listOptionsSecond(List<String> options) {
    _listOptionsRowSecond = options;
    notifyListeners();
  }

  List<String> get listOptionsSecond => _listOptionsRowSecond;

  set valueFirst(num value) {
    _valueFirst = value;
    _calculate();
    notifyListeners();
  }

  set valueSecond(num value) {
    _valueSecond = value;
    _calculate();
    notifyListeners();
  }

  num get valueFirst => _valueFirst;

  num get valueSecond => _valueSecond;

  set suffixFirst(String value) {
    _suffixFirst = value;
    Log.i("change suffix FIRST: $_suffixFirst");
    _calculate();
    notifyListeners();
  }

  set suffixSecond(String value) {
    _suffixSecond = value;
    Log.i("change suffix SECOND: $_suffixSecond");
    _calculate();
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
    _calculate();
    notifyListeners();
  }

  /// Spit the string from dropdown list, for example get the value "mA" and extract "m"
  Notation _getNotation(String notation) {
    return Unit.getNotationValueWithStringMap()[notation.substring(0, 1)] ??
        Notation.UNIT;
  }

  void _calculate() {
    num value = 0.0;

    if (_operation == UnitType.A) {
      value = Current.calculateCurrent(
        voltage: ResultValue(
                valueRaw: _valueFirst, notationBase: _getNotation(_suffixFirst))
            .realValue,
        resistance: ResultValue(
                valueRaw: _valueSecond,
                notationBase: _getNotation(_suffixSecond))
            .realValue,
      );
      result = ResultValue(valueRaw: value);
      value = Power.powerForCurrent(
        voltage: ResultValue(
                valueRaw: _valueFirst, notationBase: _getNotation(_suffixFirst))
            .realValue,
        resistance: ResultValue(
                valueRaw: _valueSecond,
                notationBase: _getNotation(_suffixSecond))
            .realValue,
      );
      resultMini = ResultValue(valueRaw: value);
    } else if (_operation == UnitType.V) {
      value = Voltage.calculateVoltage(
          current: ResultValue(
                  valueRaw: _valueFirst,
                  notationBase: _getNotation(_suffixFirst))
              .realValue,
          resistance: ResultValue(
                  valueRaw: _valueSecond,
                  notationBase: _getNotation(_suffixSecond))
              .realValue);
      result = ResultValue(valueRaw: value);

      value = Power.powerForVoltage(
        current: ResultValue(
                valueRaw: _valueFirst, notationBase: _getNotation(_suffixFirst))
            .realValue,
        resistance: ResultValue(
                valueRaw: _valueSecond,
                notationBase: _getNotation(_suffixSecond))
            .realValue,
      );
      resultMini = ResultValue(valueRaw: value);
    } else if (_operation == UnitType.R) {
      value = Resistance.calculateResistance(
        voltage: ResultValue(
                valueRaw: _valueFirst, notationBase: _getNotation(_suffixFirst))
            .realValue,
        current: ResultValue(
                valueRaw: _valueSecond,
                notationBase: _getNotation(_suffixSecond))
            .realValue,
      );
      result = ResultValue(valueRaw: value);

      value = Power.powerForResistance(
          voltage: ResultValue(
                  valueRaw: _valueFirst,
                  notationBase: _getNotation(_suffixFirst))
              .realValue,
          current: ResultValue(
                  valueRaw: _valueSecond,
                  notationBase: _getNotation(_suffixSecond))
              .realValue);
      resultMini = ResultValue(valueRaw: value);
    }
  }
}

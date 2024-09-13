import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ohms_law/home_widgets/input_data_widget.dart';
import 'package:ohms_law/util/entity/law/unit.dart';
import 'package:ohms_law/util/entity/passive/voltage.dart';
import 'package:ohms_law/util/helpers/set_input_data.dart';
import 'package:ohms_law/util/entity/suffix.dart';

import '../util/entity/law/current.dart.old';
import '../util/entity/law/power.dart.old';
import '../util/entity/law/resistance.dart';
import '../util/entity/law/voltage.dart.old';
import '../util/entity/result_value.dart';
import '../util/entity/suffix.dart';

class OhmModel extends ChangeNotifier {
  late UnitType _operation;
  late bool _activatePower;
  late bool _secondOptionPower;
  late num _valueFirst;
  late num _valueSecond;
  late String _suffixFirst;
  late String _suffixSecond;
  late List<String> _listOptionsRowFirst;
  late List<String> _listOptionsRowSecond;
  late ResultValue _resultMini;
  late ResultValue _result;
  late TextEditingController _controllerFirst;
  late TextEditingController _controllerSecond;

  OhmModel() {
    _initValues();
  }

  void _initValues() {
    _operation = UnitType.A;
    _activatePower = false;
    _secondOptionPower = false;
    _valueFirst = 0.0;
    _valueSecond = 0.0;
    _suffixFirst = Unit.getUnitLetterString()[UnitType.V]!;
    _suffixSecond = Unit.getUnitLetterString()[UnitType.R]!;
    _listOptionsRowFirst =
        getSuffix(position: PositionRow.first, unitType: _operation);
    _listOptionsRowSecond =
        getSuffix(position: PositionRow.second, unitType: _operation);

    _resultMini = ResultValue(valueRaw: 0);
    _result = ResultValue(valueRaw: 0);
    _controllerFirst = TextEditingController();
    _controllerSecond = TextEditingController();
  }

  void clear() {
    _initValues();
    clearInputs();
    notifyListeners();
  }

  void clearInputs() {
    _controllerFirst.clear();
    _controllerSecond.clear();
  }

  set result(ResultValue value) {
    _result = value;
    notifyListeners();
  }

  TextEditingController get controllerFirst => _controllerFirst;
  TextEditingController get controllerSecond => _controllerSecond;
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
    _calculate();
    notifyListeners();
  }

  set suffixSecond(String value) {
    _suffixSecond = value;
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

  bool get isSecondOption => _secondOptionPower;
  bool get isPower => _activatePower;

  set isSecondOption(bool status) {
    _secondOptionPower = status;
    _calculate();
    notifyListeners();
  }

  set isPower(bool status) {
    _activatePower = status;
    _calculate();
    notifyListeners();
  }

  /// send and render result
  void _renderResult(ResultValue resultMain, ResultValue resultSecond) {
    result = resultMain;
    resultMini = resultSecond;
  }

  Future<void> _calculate() async {
    /// Spit the string from dropdown list, for example get the value "mA" and extract "m"
    Notation getNotation(String notation) {
      return Suffix.getNotationValueWithStringMap()[notation.substring(0, 1)] ??
          Notation.UNIT;
    }

    num value = 0.0;
    late ResultValue resultMain = ResultValue(valueRaw: 0);
    late ResultValue resultSecond = ResultValue(valueRaw: 0);

    if (_operation == UnitType.A) {
      // value = Current.calculateCurrent(
      //   voltage: ResultValue(
      //           valueRaw: _valueFirst, notationBase: getNotation(_suffixFirst))
      //       .realValue,
      //   resistance: ResultValue(
      //           valueRaw: _valueSecond,
      //           notationBase: getNotation(_suffixSecond))
      //       .realValue,
      // );
      // resultMain = ResultValue(valueRaw: value);
      // value = Power.powerForCurrent(
      //   voltage: ResultValue(
      //           valueRaw: _valueFirst, notationBase: getNotation(_suffixFirst))
      //       .realValue,
      //   resistance: ResultValue(
      //           valueRaw: _valueSecond,
      //           notationBase: getNotation(_suffixSecond))
      //       .realValue,
      // );
      // resultSecond = ResultValue(valueRaw: value);
    } else if (_operation == UnitType.V) {
      // value = Voltage.calculateVoltage(
      //     current: ResultValue(
      //             valueRaw: _valueFirst,
      //             notationBase: getNotation(_suffixFirst))
      //         .realValue,
      //     resistance: ResultValue(
      //             valueRaw: _valueSecond,
      //             notationBase: getNotation(_suffixSecond))
      //         .realValue);
      // resultMain = ResultValue(valueRaw: value);
      //
      // value = Power.powerForVoltage(
      //   current: ResultValue(
      //           valueRaw: _valueFirst, notationBase: getNotation(_suffixFirst))
      //       .realValue,
      //   resistance: ResultValue(
      //           valueRaw: _valueSecond,
      //           notationBase: getNotation(_suffixSecond))
      //       .realValue,
      // );
      // resultSecond = ResultValue(valueRaw: value);
    } else if (_operation == UnitType.R) {
      // value = ResistanceLaw.ohm(passive1: Voltage(value: value), passive2: passive2);
      //   ResultValue(
      //           valueRaw: _valueFirst, notationBase: getNotation(_suffixFirst))
      //       .realValue,
      //   current: ResultValue(
      //           valueRaw: _valueSecond,
      //           notationBase: getNotation(_suffixSecond))
      //       .realValue,
      // );
      // resultMain = ResultValue(valueRaw: value);
      //
      // value = Power.powerForResistance(
      //     voltage: ResultValue(
      //             valueRaw: _valueFirst,
      //             notationBase: getNotation(_suffixFirst))
      //         .realValue,
      //     current: ResultValue(
      //             valueRaw: _valueSecond,
      //             notationBase: getNotation(_suffixSecond))
      //         .realValue);
      // resultSecond = ResultValue(valueRaw: value);
    }

    _renderResult(resultMain, resultSecond);
  }
}

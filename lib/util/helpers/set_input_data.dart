import 'package:flutter/material.dart';
import 'package:ohms_law/home_widgets/input_data_widget.dart';
import 'package:ohms_law/util/entity/law/unit.dart';
import 'package:ohms_law/util/helpers/log.dart';
import 'package:ohms_law/util/entity/suffix.dart';

import '../../providers/ohm_model.dart';

/// Return the long name for unit
///      V: "Voltage"
///      A: 'Current'
///      R: "Resistance"'
///      W: "Power"
String getLabel(
    {required PositionRow position,
    required UnitType unitType,
    bool isPower = false}) {
  if (position == PositionRow.first) {
    if (isPower) {
      return Unit.getUnitString(UnitType.W);
    } else if (unitType == UnitType.A || unitType == UnitType.R) {
      return Unit.getUnitString(UnitType.V);
    } else if (unitType == UnitType.V) {
      return Unit.getUnitString(UnitType.A);
    }
  } else if (position == PositionRow.second) {
    if (unitType == UnitType.A || unitType == UnitType.V) {
      return Unit.getUnitString(UnitType.R);
    } else if (unitType == UnitType.R) {
      return Unit.getUnitString(UnitType.A);
    }
  }

  return "Value";
}

/// Generate a list for dropdown menu
/// For example:
///    "pV",
///     "nV",
///     "uV",
///     "mV",
///     "V",
///     "kV",
///     "MV",
///     "GV"
List<String> getSuffix(
    {required PositionRow position,
    required UnitType unitType,
    bool isPower = false}) {
  String letter = "";

  if (position == PositionRow.first && isPower) {
    letter = Unit.getUnitLetterString()[UnitType.W]!;
  } else if (position == PositionRow.first) {
    if (unitType == UnitType.A || unitType == UnitType.R) {
      letter = Unit.getUnitLetterString()[UnitType.V]!;
    } else if (unitType == UnitType.V) {
      letter = Unit.getUnitLetterString()[UnitType.A]!;
    }
  } else if (position == PositionRow.second) {
    if (unitType == UnitType.A || unitType == UnitType.V) {
      letter = Unit.getUnitLetterString()[UnitType.R]!;
    }
    if (unitType == UnitType.R) {
      letter = Unit.getUnitLetterString()[UnitType.A]!;
    }
  }

  List<String> listSuffix = Suffix.getNotationStringMap()
      .values
      .map<String>(
        (value) => "$value$letter",
      )
      .toList();

  Log.i("generate suffix: $listSuffix");
  return listSuffix;
}

void setListOptionsToInputs({required ChangeNotifier ohmModel}) {
  ohmModel = ohmModel as OhmModel;
  ohmModel.listOptionsFirst = getSuffix(
      position: PositionRow.first,
      unitType: ohmModel.operation,
      isPower: ohmModel.isPower);
  ohmModel.suffixFirst = ohmModel.listOptionsFirst[4];

  ohmModel.listOptionsSecond = getSuffix(
      position: PositionRow.second,
      unitType: ohmModel.operation,
      isPower: ohmModel.isPower);
  ohmModel.suffixSecond = ohmModel.listOptionsSecond[4];
}

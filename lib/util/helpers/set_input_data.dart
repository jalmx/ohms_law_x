import 'package:ohms_law/home_widgets/input_data_widget.dart';
import 'package:ohms_law/util/misc/units.dart';

//TODO need to add for power calculation

/// Return the long name for unit
///      V: "Voltage"
///      A: 'Current'
///      R: "Resistance"'
///      W: "Power"
String getLabel({required PositionRow position, required UnitType unitType}) {
  if (position == PositionRow.first) {
    if (unitType == UnitType.A || unitType == UnitType.R) {
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
//     "nV",
//     "uV",
//     "mV",
//     "V",
//     "kV",
//     "MV",
//     "GV"
List<String> getSuffix(
    {required PositionRow position, required UnitType unitType}) {
  String letter = "";

  if (position == PositionRow.first) {
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

  List<String> listSuffix = Unit.getNotationStringMap()
      .values
      .map<String>(
        (value) => "$value$letter",
      )
      .toList();

  //print("the list: $listSuffix");
  return listSuffix;
}

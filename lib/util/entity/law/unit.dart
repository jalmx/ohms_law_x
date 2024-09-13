import 'package:ohms_law/util/entity/suffix.dart';
enum UnitType {
  V,
  A,
  R,
  W,
}

class Unit {
  static Map<UnitType, String> getUnitLetterString() {
    return {
      UnitType.A: "A",
      UnitType.R: "Ω",
      UnitType.V: "V",
      UnitType.W: "W",
    };
  }

  static String getUnitString(final UnitType unit) {
    if (unit == UnitType.V) {
      return "Voltage";
    } else if (unit == UnitType.A) {
      return 'Current';
    } else if (unit == UnitType.R) {
      return "Resistance";
    } else if (unit == UnitType.W) {
      return "Power";
    } else {
      return "";
    }
  }

  static Notation parseSuffixStringToNotation({required String letter}) {
    if (letter.isNotEmpty && letter.length < 3) {
      letter = letter.length == 1 ? letter : letter.substring(0, 1);
      return Suffix.getNotationValueWithStringMap()[letter] ?? Notation.UNIT;
    } else {
      return Notation.UNIT;
    }
  }
}

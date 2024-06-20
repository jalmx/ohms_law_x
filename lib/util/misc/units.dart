// ignore_for_file: constant_identifier_names

enum UnitType {
  V,
  A,
  R,
  W,
}

enum Notation {
  PICO,
  NANO,
  MICRO,
  MILI,
  UNIT,
  KILO,
  MEGA,
  GIGA,
}

class Unit {
  static const num PICO = 0.000000000001;
  static const num NANO = 0.000000001;
  static const num MICRO = 0.000001;
  static const num MILI = 0.001;
  static const num UNIT = 1;
  static const num KILO = 1000;
  static const num MEGA = 1000000;
  static const num GIGA = 1000000000;

  Unit._();

  static List<num> getNotationValue() {
    return [PICO, NANO, MICRO, MILI, UNIT, KILO, MEGA, GIGA];
  }

  static Map<Notation, String> getNotationStringMap() {
    return {
      Notation.PICO: "p",
      Notation.NANO: "n",
      Notation.MICRO: "u",
      Notation.MILI: "m",
      Notation.UNIT: "",
      Notation.KILO: "k",
      Notation.MEGA: "M",
      Notation.GIGA: "G"
    };
  }

  static Map<Notation, num> getNotationValueMap() {
    return {
      Notation.PICO: PICO,
      Notation.NANO: NANO,
      Notation.MICRO: MICRO,
      Notation.MILI: MILI,
      Notation.UNIT: UNIT,
      Notation.KILO: KILO,
      Notation.MEGA: MEGA,
      Notation.GIGA: GIGA
    };
  }

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
}

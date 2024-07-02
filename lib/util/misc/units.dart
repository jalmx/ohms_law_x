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

  const Unit._();

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

  static Map<String, Notation> getNotationValueWithStringMap() {
    return {
      "p": Notation.PICO,
      "n": Notation.NANO,
      "u": Notation.MICRO,
      "m": Notation.MILI,
      "": Notation.UNIT,
      "k": Notation.KILO,
      "M": Notation.MEGA,
      "G": Notation.GIGA
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

  // static ResultValue getBestFormat(
  //     {required num value, Notation notation = Notation.UNIT}) {
  //   return ResultValue(valueRaw: value, notationBase: notation);
  // }

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
      return getNotationValueWithStringMap()[letter] ?? Notation.UNIT;
    } else {
      return Notation.UNIT;
    }
  }
}

//============================================================================

class ResultValue {

  final num _valueRaw;
  final num _realValue;
  late num _bestValue;
  final Notation _notationBase;
  Notation _notation = Notation.UNIT;


  String _suffix = Unit.getNotationStringMap()[Notation.UNIT]!;
  num _suffixValue = Unit.getNotationValueMap()[Notation.UNIT]!;

  ResultValue({required num valueRaw, notationBase = Notation.UNIT})
      : _valueRaw = valueRaw,
        _realValue = valueRaw * Unit.getNotationValueMap()[notationBase]!,
        _notationBase = notationBase {
    _processValue();
  }

  void _setValue({required Notation notation}) {
    _bestValue = _realValue / Unit.getNotationValueMap()[notation]!;
    _notation = notation;
    _suffix = Unit.getNotationStringMap()[_notation]!;
    _suffixValue = Unit.getNotationValueMap()[_notation]!;
  }

  void _processValue() {

    if (_valueRaw == 0) {
      _setValue(notation: Notation.UNIT);
    } else if ((realValue > Unit.PICO && realValue < Unit.NANO) ||
        realValue < Unit.PICO) {
      _setValue(notation: Notation.PICO);
    } else if (realValue >= Unit.NANO && realValue < Unit.MICRO) {
      _setValue(notation: Notation.NANO);
    } else if (realValue >= Unit.MICRO && realValue < Unit.MILI) {
      _setValue(notation: Notation.MICRO);
    } else if (realValue >= Unit.MILI && realValue < Unit.UNIT) {
      _setValue(notation: Notation.MILI);
    } else if (realValue >= Unit.UNIT && realValue < Unit.KILO) {
      _setValue(notation: Notation.UNIT);
    } else if (realValue >= Unit.KILO && realValue < Unit.MEGA) {
      _setValue(notation: Notation.KILO);
    } else if (realValue >= Unit.MEGA && realValue < Unit.GIGA) {
      _setValue(notation: Notation.MEGA);
    } else {
      _setValue(notation: Notation.GIGA);
    }

    if (realValue.isInfinite || realValue.isNaN) {
      _setValue(notation: Notation.UNIT);
    }
  }

  Notation get notationBase => _notationBase;

  Notation get notation => _notation;

  num get realValue => _realValue;

  num get bestValue => _bestValue;

  num get valueRaw => _valueRaw;

  String get suffixString => _suffix;

  num get suffixValue => _suffixValue;

  @override
  String toString() {
    return "Result => value real: $_realValue, value adjust: $_bestValue <-> suffix: $_suffix";
  }
}

import 'suffix.dart';

class ResultValue {
  final num _valueRaw;
  final num _realValue;
  late num _bestValue;
  final Notation _notationBase;
  Notation _notation = Notation.UNIT;

  String _suffix = Suffix.getNotationStringMap()[Notation.UNIT]!;
  num _suffixValue = Suffix.getNotationValueMap()[Notation.UNIT]!;

  ResultValue({required num valueRaw, notationBase = Notation.UNIT})
      : _valueRaw = valueRaw,
        _realValue = valueRaw * Suffix.getNotationValueMap()[notationBase]!,
        _notationBase = notationBase {
    _processValue();
  }

  void _setValue({required Notation notation}) {
    _bestValue = _realValue / Suffix.getNotationValueMap()[notation]!;
    _notation = notation;
    _suffix = Suffix.getNotationStringMap()[_notation]!;
    _suffixValue = Suffix.getNotationValueMap()[_notation]!;
  }

  void _processValue() {
    if (_valueRaw == 0) {
      _setValue(notation: Notation.UNIT);
    } else if ((realValue > Suffix.PICO && realValue < Suffix.NANO) ||
        realValue < Suffix.PICO) {
      _setValue(notation: Notation.PICO);
    } else if (realValue >= Suffix.NANO && realValue < Suffix.MICRO) {
      _setValue(notation: Notation.NANO);
    } else if (realValue >= Suffix.MICRO && realValue < Suffix.MILI) {
      _setValue(notation: Notation.MICRO);
    } else if (realValue >= Suffix.MILI && realValue < Suffix.UNIT) {
      _setValue(notation: Notation.MILI);
    } else if (realValue >= Suffix.UNIT && realValue < Suffix.KILO) {
      _setValue(notation: Notation.UNIT);
    } else if (realValue >= Suffix.KILO && realValue < Suffix.MEGA) {
      _setValue(notation: Notation.KILO);
    } else if (realValue >= Suffix.MEGA && realValue < Suffix.GIGA) {
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

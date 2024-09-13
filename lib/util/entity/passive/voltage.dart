import 'package:ohms_law/util/entity/law/unit.dart';
import 'package:ohms_law/util/entity/passive/passive_abstract.dart';

class Voltage extends Passive {
  Voltage({required super.value});

  @override
  String get symbol => "V";

  @override
  UnitType get unitType => UnitType.V;

  @override
  String toString() {
    return "{ Type: $unitType, symbol: $symbol, value: $value }";
  }
}

import 'package:ohms_law/util/entity/law/unit.dart';
import 'package:ohms_law/util/entity/passive/passive_abstract.dart';

class Power extends Passive {
  Power({required super.value});

  @override
  String get symbol => "P";

  @override
  UnitType get unitType => UnitType.W;

  @override
  String toString() {
    return "{ Type: $unitType, symbol: $symbol, value: $value }";
  }
}

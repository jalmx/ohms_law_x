import 'package:ohms_law/util/entity/law/unit.dart';
import 'package:ohms_law/util/entity/passive/passive_abstract.dart';

class Current extends Passive {
  Current({required super.value});

  @override
  String get symbol => "A";

  @override
  UnitType get unitType => UnitType.A;

  @override
  String toString() {
    return "{ Type: $unitType, symbol: $symbol, value: $value }";
  }
}

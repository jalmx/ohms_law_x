import 'package:ohms_law/util/entity/law/unit.dart';
import 'package:ohms_law/util/entity/passive/passive_abstract.dart';

class Resistance extends Passive {
  Resistance({required super.value});

  @override
  String get symbol => "Ω";

  @override
  UnitType get unitType => UnitType.R;

  @override
  String toString() {
    return "{ Type: $unitType, symbol: $symbol, value: $value }";
  }
}

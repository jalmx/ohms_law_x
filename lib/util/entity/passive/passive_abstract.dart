import 'package:ohms_law/util/entity/law/unit.dart';
import 'package:ohms_law/util/entity/result_value.dart';

abstract class Passive {
  final ResultValue value;

  Passive({required this.value});

  String get symbol;

  UnitType get unitType;
}


num getVoltageBase(num current, num resistance){
  return current * resistance;
}
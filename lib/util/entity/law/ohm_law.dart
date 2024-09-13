import 'package:ohms_law/util/entity/passive/passive_abstract.dart';
import 'package:ohms_law/util/entity/result_value.dart';

abstract class OhmLaw {
  final Passive passive1;
  final Passive passive2;

  OhmLaw.ohm({required this.passive1, required this.passive2});

  void setValue();

  void setPower();

  ResultValue get power;

  ResultValue get value;
}

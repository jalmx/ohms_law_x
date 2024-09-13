import 'package:ohms_law/util/entity/law/ohm_law.dart';
import 'package:ohms_law/util/entity/passive/current.dart';
import 'package:ohms_law/util/entity/passive/power.dart';
import 'package:ohms_law/util/entity/passive/voltage.dart';
import 'package:ohms_law/util/entity/result_value.dart';

class ResistanceLaw extends OhmLaw {
  late final ResultValue _value;
  late final ResultValue _power;

  ResistanceLaw.ohm({required super.passive1, required super.passive2})
      : super.ohm() {
    setValue();
    setPower();
  }

  @override
  void setPower() {
    // TODO: implement setPower
  }

  @override
  void setValue() {
    if (passive1 is Power || passive2 is Power) {
      if (passive1 is Power) {

        if(passive2 is Voltage){

        }else if (passive2 is Current){

        }

      } else if (passive2 is Power) {

        if(passive2 is Current){

        }else if (passive2 is Voltage){

        }


      } else {
        throw Error();
      }
    } else {
      if (passive1 is Voltage && passive2 is Current) {
        num result = passive1.value.realValue / passive2.value.realValue;
        _value = ResultValue(valueRaw: result);
      } else if (passive1 is Current && passive2 is Voltage) {
        num result = passive2.value.realValue / passive1.value.realValue;
        _value = ResultValue(valueRaw: result);
      } else {
        throw Error();
      }
    }
  }

  @override
  ResultValue get power => _power;

  @override
  ResultValue get value => _value;
}

main() {}

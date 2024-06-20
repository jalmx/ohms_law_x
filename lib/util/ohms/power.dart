import 'dart:math';

class Power {
  Power._();

  static num powerForVoltage({required num current, required num resistance}) {
    return pow(current, 2) * resistance;
  }

  static num powerForCurrent({required num voltage, required num resistance}) {
    return pow(voltage, 2) / resistance;
  }

  static num powerForResistance({required num voltage, required num current}) {
    return voltage * current;
  }
}

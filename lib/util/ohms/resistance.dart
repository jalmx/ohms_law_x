import 'dart:math';

class Resistance {
  Resistance._();

  static num calculateResistance({required num voltage, required num current}) {
    return voltage / current;
  }

  static num calculateResistancePowerCurrent(
      {required num power, required num current}) {
    return power / pow(current, 2);
  }

  static num calculateResistancePowerVoltage(
      {required num power, required num voltage}) {
    return pow(voltage, 2) / power;
  }
}

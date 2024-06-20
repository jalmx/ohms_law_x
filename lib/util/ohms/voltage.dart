import 'dart:math';

class Voltage {
Voltage._();

   static num calculateVoltage({required num current, required num resistance}) {
    return current * resistance;
  }

   static num calculateVoltagePowerCurrent({required num power,required num current}) {
    return power / current;
  }

   static num calculateVoltagePowerResistance({required num power, required num resistance}) {
    return sqrt(power * resistance);
  }

}
class OhmsLaw {
  OhmsLaw._();

  /// return the value of voltage
  static num getVolt({required num resistance, required num current}) {
    return resistance * current;
  }

  /// return the value of current
  static num getCurrent({required num resistance, required num voltage}) {
    return voltage / resistance;
  }

  /// return the value of voltage
  static num getResistance({required num voltage, required num current}) {
    return voltage / current;
  }
}

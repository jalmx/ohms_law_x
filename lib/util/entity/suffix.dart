

enum Notation {
  PICO,
  NANO,
  MICRO,
  MILI,
  UNIT,
  KILO,
  MEGA,
  GIGA,
}

class Suffix {
  static const num PICO = 0.000000000001;
  static const num NANO = 0.000000001;
  static const num MICRO = 0.000001;
  static const num MILI = 0.001;
  static const num UNIT = 1;
  static const num KILO = 1000;
  static const num MEGA = 1000000;
  static const num GIGA = 1000000000;

  const Suffix._();

  static Map<Notation, String> getNotationStringMap() {
    return {
      Notation.PICO: "p",
      Notation.NANO: "n",
      Notation.MICRO: "u",
      Notation.MILI: "m",
      Notation.UNIT: "",
      Notation.KILO: "k",
      Notation.MEGA: "M",
      Notation.GIGA: "G"
    };
  }

  static Map<String, Notation> getNotationValueWithStringMap() {
    return {
      "p": Notation.PICO,
      "n": Notation.NANO,
      "u": Notation.MICRO,
      "m": Notation.MILI,
      "": Notation.UNIT,
      "k": Notation.KILO,
      "M": Notation.MEGA,
      "G": Notation.GIGA
    };
  }

  static Map<Notation, num> getNotationValueMap() {
    return {
      Notation.PICO: PICO,
      Notation.NANO: NANO,
      Notation.MICRO: MICRO,
      Notation.MILI: MILI,
      Notation.UNIT: UNIT,
      Notation.KILO: KILO,
      Notation.MEGA: MEGA,
      Notation.GIGA: GIGA
    };
  }
}

import 'dart:math';

class CalculatorLogic {
  double calculate(double a, double b, String op) {
    switch (op) {
      case "+":
        return a + b;

      case "-":
        return a - b;

      case "×":
        return a * b;

      case "÷":
        return a / b;

      default:
        return b;
    }
  }

  double percent(double value) {
    return value / 100;
  }

  double square(double value) {
    return value * value;
  }

  double sqrtValue(double value) {
    return sqrt(value);
  }

  double inverse(double value) {
    return 1 / value;
  }
}

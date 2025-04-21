import 'package:flutter/material.dart';

class TemperatureProvider extends ChangeNotifier {
  double celsius = 0;
  double fahrenheit = 0;
  double kelvin = 0;
  double reamur = 0;

  void setCelsius(String value) {
    celsius = double.tryParse(value) ?? 0;
    _convert();
  }

  void _convert() {
    fahrenheit = (celsius * 9 / 5) + 32;
    kelvin = celsius + 273.15;
    reamur = celsius * 4 / 5;
    notifyListeners();
  }
}

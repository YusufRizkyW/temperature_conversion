double convertTemperature(double input, String fromUnit, String toUnit) {
  double tempInCelsius = input;

  // Konversi ke Celsius terlebih dahulu
  if (fromUnit == "Fahrenheit") {
    tempInCelsius = (input - 32) * 5 / 9;
  } else if (fromUnit == "Reamur") {
    tempInCelsius = input * 5 / 4;
  } else if (fromUnit == "Kelvin") {
    tempInCelsius = input - 273.15;
  }

  // Konversi dari Celsius ke satuan tujuan
  if (toUnit == "Celsius") {
    return tempInCelsius;
  } else if (toUnit == "Fahrenheit") {
    return (tempInCelsius * 9 / 5) + 32;
  } else if (toUnit == "Reamur") {
    return tempInCelsius * 4 / 5;
  } else if (toUnit == "Kelvin") {
    return tempInCelsius + 273.15;
  }

  return input;
}

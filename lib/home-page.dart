import 'package:flutter/material.dart';
import 'conversion.dart'; // Import logika konversi suhu

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController celsiusController = TextEditingController();
  double fahrenheit = 0;
  double kelvin = 0;
  double reamur = 0;

  void convertTemperature() {
    double celsius = double.tryParse(celsiusController.text) ?? 0;
    setState(() {
      fahrenheit = convertToFahrenheit(celsius);
      kelvin = convertToKelvin(celsius);
      reamur = convertToReamur(celsius);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Konversi Suhu")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: celsiusController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Masukkan Suhu (°C)"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: convertTemperature,
              child: const Text("Konversi"),
            ),
            const SizedBox(height: 20),
            Text("Fahrenheit: $fahrenheit °F", style: const TextStyle(fontSize: 18)),
            Text("Kelvin: $kelvin K", style: const TextStyle(fontSize: 18)),
            Text("Reamur: $reamur °R", style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

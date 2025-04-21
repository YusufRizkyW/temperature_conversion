import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/temperature_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final tempProvider = Provider.of<TemperatureProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Konversi Suhu")),
      backgroundColor: const Color(0xFFF6F6F6),
      body: Center(
        child: Card(
          elevation: 12,
          margin: const EdgeInsets.all(24),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Masukkan Suhu dalam Celcius",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 16),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Suhu (°C)",
                    prefixIcon: const Icon(Icons.thermostat),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onChanged: tempProvider.setCelsius,
                ),
                const SizedBox(height: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildResult("Fahrenheit", "${tempProvider.fahrenheit} °F"),
                    _buildResult("Kelvin", "${tempProvider.kelvin} K"),
                    _buildResult("Reamur", "${tempProvider.reamur} °R"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResult(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 16)),
          Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

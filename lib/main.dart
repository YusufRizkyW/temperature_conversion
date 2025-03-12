import 'package:flutter/material.dart';
import 'conversion.dart';

void main() {
  runApp(KonversiSuhuApp());
}

class KonversiSuhuApp extends StatefulWidget {
  @override
  _KonversiSuhuAppState createState() => _KonversiSuhuAppState();
}

class _KonversiSuhuAppState extends State<KonversiSuhuApp> {
  double input = 0;
  double output = 0;
  String fromUnit = "Celsius";
  String toUnit = "Fahrenheit";

  final List<String> suhuUnits = ["Celsius", "Fahrenheit", "Reamur", "Kelvin"];

  void convert() {
    setState(() {
      output = convertTemperature(input, fromUnit, toUnit);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Konversi Suhu")),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Input Field
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Masukkan suhu",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.thermostat),
                ),
                onChanged: (value) {
                  setState(() {
                    input = double.tryParse(value) ?? 0;
                  });
                },
              ),
              SizedBox(height: 20),

              // Dropdown satuan asal
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: fromUnit,
                      decoration: InputDecoration(labelText: "Dari"),
                      items: suhuUnits.map((unit) {
                        return DropdownMenuItem(value: unit, child: Text(unit));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          fromUnit = value!;
                        });
                      },
                    ),
                  ),
                  Icon(Icons.arrow_forward),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: toUnit,
                      decoration: InputDecoration(labelText: "Ke"),
                      items: suhuUnits.map((unit) {
                        return DropdownMenuItem(value: unit, child: Text(unit));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          toUnit = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Tombol Konversi
              ElevatedButton(
                onPressed: convert,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text("Konversi"),
              ),
              SizedBox(height: 20),

              // Hasil konversi
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Hasil: $output $toUnit",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

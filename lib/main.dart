import 'package:flutter/material.dart';
import 'login-page.dart'; // Import halaman login

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menghilangkan label debug
      title: 'Aplikasi Konversi Suhu',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyLoginPage(), // Halaman pertama adalah Login
    );
  }
}

import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final String _userEmail = "user@example.com";
  final String _userPassword = "123456";

  bool _isAuthenticated = false;
  String _errorMessage = '';

  bool get isAuthenticated => _isAuthenticated;
  String get errorMessage => _errorMessage;

  bool login(String email, String password) {
    if (email == _userEmail && password == _userPassword) {
      _isAuthenticated = true;
      _errorMessage = '';
      notifyListeners();
      return true;
    } else {
      _isAuthenticated = false;
      _errorMessage = 'Email atau password salah!';
      notifyListeners();
      return false;
    }
  }

  void logout() {
    _isAuthenticated = false;
    notifyListeners();
  }
}

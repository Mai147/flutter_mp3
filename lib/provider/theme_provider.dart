import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _mode;
  ThemeMode get mode => _mode;
  ThemeProvider({
    ThemeMode mode = ThemeMode.dark,
  }) : _mode = mode;

  void toggleMode() {
    _mode = _mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void setLightMode() {
    _mode = ThemeMode.light;
    notifyListeners();
  }

  void setDarkMode() {
    _mode = ThemeMode.dark;
    notifyListeners();
  }
}

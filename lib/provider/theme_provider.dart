import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _mode;
  ThemeMode get mode => _mode;
  String _modeString;
  String get modeString => _modeString;
  ThemeProvider({ThemeMode mode = ThemeMode.dark, String modeString = "dark"})
      : _mode = mode,
        _modeString = modeString;

  // void toggleMode() {
  //   _mode = _mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  //   notifyListeners();
  // }

  void setLightMode() {
    _mode = ThemeMode.light;
    _modeString = "light";
    notifyListeners();
  }

  void setDarkMode() {
    _mode = ThemeMode.dark;
    _modeString = "dark";
    notifyListeners();
  }

  void setByDeviceMode() {
    _modeString = "device";
    changeByDeviceMode();
  }

  void changeByDeviceMode() {
    Brightness brightness = WidgetsBinding.instance.window.platformBrightness;
    if (brightness == Brightness.light) {
      _mode = ThemeMode.light;
    } else {
      _mode = ThemeMode.dark;
    }
    notifyListeners();
  }
}

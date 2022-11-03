import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _mode;
  ThemeMode get mode => _mode;
  String _modeName;
  String get modeName => _modeName;
  ThemeProvider({ThemeMode mode = ThemeMode.dark, String modeName = "dark"})
      : _mode = mode,
        _modeName = modeName;

  void setLightMode() {
    _mode = ThemeMode.light;
    _modeName = "light";
    notifyListeners();
  }

  void setDarkMode() {
    _mode = ThemeMode.dark;
    _modeName = "dark";
    notifyListeners();
  }

  void setByDeviceMode() {
    _modeName = "device";
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

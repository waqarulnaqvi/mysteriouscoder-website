import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  int _hoveredIndex = -1;

  //Getter for hoveredIndex
  int get hoveredItem => _hoveredIndex;

  //Getter for mode
  ThemeMode get mode => themeMode;

  //Setter for mode
  set mode(ThemeMode mode) {
    themeMode = mode;
    notifyListeners();
  }

  //Setter for hoveredIndex
  set hoveredItem(int index) {
    _hoveredIndex = index;
    notifyListeners();
  }
}

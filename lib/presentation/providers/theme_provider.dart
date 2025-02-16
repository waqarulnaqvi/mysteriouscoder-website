import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  int _hoveredIndex = -1;
  String _countryCode = "+91";

  //Getter for countryCode
  String get countryCode => _countryCode;

  //Getter for hoveredIndex
  int get hoveredItem => _hoveredIndex;

  //Getter for mode
  ThemeMode get mode => themeMode;


  //Setter for countryCode
  set countryCode(String code) {
    _countryCode = code;
    notifyListeners();
  }

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

import 'package:flutter/material.dart';

class DarkModeService extends ChangeNotifier {
  bool _darkmode = false;

  bool get getDarkmode => _darkmode;

  set setDarkmode(bool value) {
    _darkmode = value;
    notifyListeners();
  }
}

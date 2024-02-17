import 'package:flutter/cupertino.dart';

class ThemeService extends ChangeNotifier{
  bool isDarkModeOn = true;

  void toggleTheme(){
    isDarkModeOn = !isDarkModeOn;
    notifyListeners();
  }
}
import 'package:flutter/material.dart';

class Screen {
  int currentScreen = 0;
}

class ScreenModel extends ChangeNotifier {
  int currentScreenState = Screen().currentScreen;

  void setScreen(int inCurrentScreen) {
    currentScreenState = inCurrentScreen;
    notifyListeners();
  }
}

ScreenModel screenModel = ScreenModel();

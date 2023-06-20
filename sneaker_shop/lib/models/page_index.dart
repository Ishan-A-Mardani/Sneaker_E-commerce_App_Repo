import 'package:flutter/material.dart';

class PageIndex extends ChangeNotifier {
  int selectedIndex = 0;

  int getPageIndex() => selectedIndex;

  void changePageIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}

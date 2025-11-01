import 'package:flutter/material.dart';

// Navigation Provider
class NavigationProvider extends ChangeNotifier {
  int _currentIndex = 0;
  final List<int> _navigationHistory = [];

  int get currentIndex => _currentIndex;
  List<int> get navigationHistory => List.unmodifiable(_navigationHistory);

  void setCurrentIndex(int index) { //add one like [0] to [0, 2]
    if (index != _currentIndex) {
      _currentIndex = index;
      _navigationHistory.add(index);
      notifyListeners();
    }
  }

  bool onBackPressed() {
    if (_navigationHistory.length > 1) { //remove last [0, 2]  to [0]
      _navigationHistory.removeLast();
      _currentIndex = _navigationHistory.last;
      notifyListeners();
      return false;
    }
    return true;
  }

  void init(int initialTab) {
    _currentIndex = initialTab;
    _navigationHistory.add(_currentIndex);
  }
}

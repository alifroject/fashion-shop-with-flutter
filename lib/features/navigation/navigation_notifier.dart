import 'package:flutter_riverpod/legacy.dart';
import './navigation_state.dart';


class NavigationNotifier extends StateNotifier<NavigationState> {
  NavigationNotifier() : super(NavigationState(currentIndex: 0, navigationHistory: [0]));

  void init(int initialTab) {
    state = NavigationState(currentIndex: initialTab, navigationHistory: [initialTab]);
  }

  void setCurrentIndex(int index) {
   if (index != state.currentIndex) {
      final updatedHistory = [...state.navigationHistory, index];
      state = state.copyWith(currentIndex: index, navigationHistory: updatedHistory);
    }
  }

  bool onBackPressed() {
    if(state.navigationHistory.length > 1) {
      final updatedHistory = [...state.navigationHistory]..removeLast();
      state = state.copyWith(
        currentIndex: updatedHistory.last,
        navigationHistory: updatedHistory,
      );
      return false; // means we handled back
    }
    return true;  // means exit app
  }

  
}
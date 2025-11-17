class NavigationState {
  final int currentIndex;
  final List<int> navigationHistory;

  NavigationState({
    required this.currentIndex,
    required this.navigationHistory,
  });

  NavigationState copyWith({int? currentIndex, List<int>? navigationHistory}) {
    return NavigationState(
      currentIndex: currentIndex ?? this.currentIndex,
      navigationHistory: navigationHistory ?? this.navigationHistory,
    );
  }
}

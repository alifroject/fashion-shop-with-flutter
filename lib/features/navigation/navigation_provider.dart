import 'package:flutter_riverpod/legacy.dart';
import 'package:outfit_store/features/navigation/navigation_state.dart';
import 'navigation_notifier.dart';

final navigationProvider =  StateNotifierProvider<NavigationNotifier, NavigationState> (
    (ref) => NavigationNotifier(),
);
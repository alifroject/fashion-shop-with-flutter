import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../routes/screen_export.dart';
import '../../features/navigation/navigation_provider.dart';

class EntryPoint extends ConsumerStatefulWidget {
  final int initialTab;
  const EntryPoint({super.key, this.initialTab = 0});

  @override
  ConsumerState<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends ConsumerState<EntryPoint> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(navigationProvider.notifier).init(widget.initialTab);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = Responsive.screenWidth(context);
    final responsiveFont = screenWidth * 0.055;

    final navState = ref.watch(navigationProvider);

    final List<Widget> pages = [
      HomeScreen(),
      Center(
        child: Text(
          'Cart Screen',
          style: theme.textTheme.titleLarge?.copyWith(
            fontSize: responsiveFont,
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
        ),
      ),
      Center(
        child: Text(
          'Favorites Screen',
          style: theme.textTheme.titleLarge?.copyWith(
            fontSize: responsiveFont,
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
        ),
      ),
      Center(
        child: Text(
          'Profile Screen',
          style: theme.textTheme.titleLarge?.copyWith(
            fontSize: responsiveFont,
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
        ),
      ),
    ];

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          final shouldExit = ref
              .read(navigationProvider.notifier)
              .onBackPressed();
          if (shouldExit) {
            Navigator.of(context).maybePop();
          }
        }
      },
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: pages[navState.currentIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: navState.currentIndex,
          onTap: (index) => ref
              .read(navigationProvider.notifier)
              .setCurrentIndex(index), //set curent index here
          type: BottomNavigationBarType.fixed,
          selectedItemColor: theme.colorScheme.primary,
          unselectedItemColor: Colors.grey,
          backgroundColor: theme.cardColor,
          elevation: 10,
          iconSize: screenWidth * 0.07,
          selectedFontSize: screenWidth * 0.035,
          unselectedFontSize: screenWidth * 0.03,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_rounded),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_rounded),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

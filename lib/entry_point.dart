import 'package:flutter/material.dart';
import '../../routes/screen_export.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = Responsive.screenWidth(context);
    final responsiveFont = screenWidth * 0.055;

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

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: pages[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
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
    );
  }
}

import 'package:flutter/material.dart';

import 'widgets/custom_bottom_navigation.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  
  final List<Widget> _screens = [
    Center(child: Text('Home Screen')),
    Center(child: Text('Cart Screen')),
    Center(child: Text('Profile Screen')),
    Center(child: Text('Messages Screen')),
  ];

  int _selectedIndex = 0;
  final _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(controller: _pageController, children: _screens),
      bottomNavigationBar: CustomBottomNavigation(
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            _pageController.jumpToPage(_selectedIndex);
          });
        },
        selectedIndex: _selectedIndex,
      ),
    );
  }
}

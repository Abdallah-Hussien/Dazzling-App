import 'package:dazzling/features/home/ui/home_Screen.dart';
import 'package:flutter/material.dart';

import 'widgets/custom_bottom_navigation.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  final List<Widget> _screens = [
    HomeScreen(name: 'name'),
    Center(child: Text('Cart Screen')),
    Center(child: Text('Profile Screen')),
    Center(child: Text('Messages Screen')),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: CustomBottomNavigation(
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedIndex: _selectedIndex,
      ),
    );
  }
}

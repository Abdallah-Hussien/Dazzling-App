import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/colors.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({
    super.key,
    this.onTap,
    required int selectedIndex,
  }) : _selectedIndex = selectedIndex;

  final int _selectedIndex;
  final void Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: ColorsManager.primary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          splashFactory: NoSplash.splashFactory,
        ),
        child: BottomNavigationBar(
          useLegacyColorScheme: false,
          currentIndex: _selectedIndex,
          onTap: onTap,
          elevation: 0,
          backgroundColor: ColorsManager.primary,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.5),
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 24.sp,
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Icon(CupertinoIcons.cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Icon(CupertinoIcons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Icon(CupertinoIcons.conversation_bubble),
              label: 'Messages',
            ),
          ],
        ),
      ),
    );
  }
}

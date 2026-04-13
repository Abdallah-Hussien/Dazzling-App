import 'package:dazzling/features/auth/login/ui/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DazzlingApp extends StatelessWidget {
  const DazzlingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Dazzling',
        debugShowCheckedModeBanner: false,
        home: Center(child: LoginScreen()),
      ),
    );
  }
}

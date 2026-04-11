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
        home: const Center(child: Text('Dazzling, Coming Soon......!')),
      ),
    );
  }
}

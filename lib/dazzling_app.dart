import 'package:dazzling/core/routing/routes_names.dart';
import 'package:dazzling/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routing/router.dart';

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
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: RoutesNames.login,
      ),
    );
  }
}

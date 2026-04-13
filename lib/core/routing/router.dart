import 'package:flutter/material.dart';

import '../../features/auth/login/ui/login_screen.dart';
import '../../features/auth/register/ui/register_screen.dart';
import 'routes_names.dart';

class AppRouter {
  AppRouter._();
  static Route? generateRoute(RouteSettings settings) {

    //this arguments to be passed in any screen like this ( arguments as ClassName )
    // final arguments = settings.arguments;
    
    switch (settings.name) {
      case RoutesNames.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RoutesNames.register:
        return MaterialPageRoute(builder: (context) => const RegisterScreen());
      // case RoutesNames.home:
      //   return MaterialPageRoute(builder: (context) => const HomeScreen());
      default:
        return null;
    }
  }
}

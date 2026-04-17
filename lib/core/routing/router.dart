import 'package:dazzling/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/login/ui/login_screen.dart';
import '../../features/auth/register/logic/register_cubit.dart';
import '../../features/auth/register/ui/register_screen.dart';
import '../../features/home/ui/home_Screen.dart';
import 'routes_names.dart';

class AppRouter {
  AppRouter._();
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginCubit(),
            child: const LoginScreen(),
          ),
        );
      case RoutesNames.register:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => RegisterCubit(),
            child: RegisterScreen(),
          ),
        );
      case RoutesNames.home:
        return MaterialPageRoute(
          builder: (context) {
            final name = settings.arguments as String? ?? "guest";
            return HomeScreen(name: name);
          },
        );
      default:
        return null;
    }
  }
}

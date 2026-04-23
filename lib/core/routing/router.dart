import 'package:dazzling/core/di/dependancy_injection.dart';
import 'package:dazzling/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:dazzling/features/cart/logic/cart_cubit.dart';
import 'package:dazzling/features/home/logic/cubit/home_cubit.dart';
import 'package:dazzling/features/root_screen/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/login/ui/login_screen.dart';
import '../../features/auth/register/logic/register_cubit.dart';
import '../../features/auth/register/ui/register_screen.dart';
import '../../features/checkout/ui/checkout_screen.dart';
import '../../features/product/logic/cubit/product_cubit.dart';
import '../../features/product/ui/product_screen.dart';
import '../../features/home/data/repo/home_repo.dart';
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
      case RoutesNames.rootScreen:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    HomeCubit(homeRepo: getIt<HomeRepo>())..getHomeCategories(),
              ),
              BlocProvider(create: (context) => getIt<CartCubit>()),
            ],
            child: RootScreen(),
          ),
        );
      case RoutesNames.home:
        return MaterialPageRoute(
          builder: (context) {
            final name = settings.arguments as String? ?? "guest";
            return HomeScreen(name: name);
          },
        );
      case RoutesNames.product:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => ProductCubit()),
              BlocProvider.value(value: getIt<CartCubit>()),
            ],
            child: ProductScreen(product: settings.arguments as dynamic),
          ),
        );
      case RoutesNames.checkout:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<CartCubit>(),
            child: CheckOutScreen(),
          ),
        );
      default:
        return null;
    }
  }
}

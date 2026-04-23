import 'package:dazzling/core/routing/routes_names.dart';
import 'package:dazzling/core/widgets/loading_layout.dart';
import 'package:dazzling/features/auth/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../logic/cubit/login_cubit.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        switch (state.runtimeType) {
          case const (LoginLoading):
            LoadingLayout.setupLogin(context);
            break;
          case const (LoginSuccess):
            Navigator.pop(context);
            final name =
                FirebaseAuth.instance.currentUser?.displayName ?? 'guest';
            Navigator.pushReplacementNamed(
              context,
              RoutesNames.rootScreen,
              arguments: name,
            );
            break;
          case const (LoginFailure):
            Navigator.pop(context);
            final error = (state as LoginFailure).error;
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Login failed: $error')));
            break;
        }
      },
      child: SizedBox.shrink(),
    );
  }
}

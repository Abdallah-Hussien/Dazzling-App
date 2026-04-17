import 'package:dazzling/core/routing/routes_names.dart';
import 'package:dazzling/core/widgets/loading_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../logic/register_cubit.dart';

class RegisterBlocListener extends StatelessWidget {
  const RegisterBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit,RegisterState>(
      listener: (context, state) {
        switch (state.runtimeType) {
          case const (RegisterLoading):
            LoadingLayout.setupLogin(context);
            break;
          case const (RegisterSuccess):
            final name = FirebaseAuth.instance.currentUser?.displayName ?? '';
            Navigator.pushReplacementNamed(
              context,
              RoutesNames.home,
              arguments: name,
            );
            break;
          case const (RegisterFailure):
            final failureState = state as RegisterFailure;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(failureState.error),
                backgroundColor: Colors.red,
              ),
            );
            break;
        }
      },
      child: SizedBox.shrink(),
    );
  }
}

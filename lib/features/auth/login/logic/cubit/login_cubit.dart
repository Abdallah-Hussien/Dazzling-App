import 'package:dazzling/features/auth/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  emitLoginStates() {
    emit(LoginLoading());
    try {
      // Simulate a login process
      Future.delayed(const Duration(seconds: 3), () {
        emit(LoginSuccess());
      });
    } catch (e) {
      emit(LoginFailure(error: e.toString()));
    }
  }
}

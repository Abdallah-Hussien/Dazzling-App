import 'package:dazzling/features/auth/login/logic/cubit/login_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  emitLoginStates() async {
    emit(LoginLoading());
    try {
      await Future.delayed(Duration(seconds: 3), () async {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
      });
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      emit(LoginFailure(error: _mapError(e.code)));
    }
  }

  String _mapError(String code) {
    switch (code) {
      case 'user-not-found':
        return 'مفيش أكونت بالإيميل ده';
      case 'wrong-password':
        return 'الباسورد غلط';
      case 'invalid-email':
        return 'الإيميل مش صحيح';
      case 'user-disabled':
        return 'الأكونت ده اتعطل';
      default:
        return 'حصل خطأ، حاول تاني';
    }
  }
}

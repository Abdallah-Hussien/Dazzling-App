import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  emitRegisterStates() async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoading());
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        await FirebaseAuth.instance.currentUser?.updateDisplayName(
          nameController.text.trim(),
        );
        Future.delayed(const Duration(seconds: 3), () {
          emit(RegisterSuccess());
        });
      }on FirebaseAuthException catch (e) {
        emit(RegisterFailure(
            error: _mapError(e.code),
        ),
        );
      }
    }
  }
  String _mapError(String code) {
    switch (code) {
      case 'email-already-in-use':
        return 'الإيميل ده موجود بالفعل';
      case 'weak-password':
        return 'الباسورد ضعيف، لازم 6 أحرف على الأقل';
      case 'invalid-email':
        return 'الإيميل مش صحيح';
      default:
        return 'حصل خطأ، حاول تاني';
    }
  }
}

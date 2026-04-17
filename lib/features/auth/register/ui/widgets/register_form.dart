import 'package:dazzling/core/helper/spacing.dart';
import 'package:dazzling/core/theme/colors.dart';
import 'package:dazzling/core/widgets/app_text_form_field.dart';
import 'package:dazzling/features/auth/register/logic/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Name',
            controller: cubit.nameController,
            validator: (p0) {
              if (p0 == null || p0.isEmpty) return "please enter your name";
              return null;
            },
          ),
          Spacing.vertical(16),
          AppTextFormField(
            hintText: 'Email@example.com',
            controller: cubit.emailController,
            validator: (p0) {
              if (p0 == null || p0.isEmpty) return "please enter your email";
              if (!p0.contains('@')) return "email isn't correct";
              return null;
            },
            inputType: TextInputType.emailAddress,
          ),
          Spacing.vertical(16),
          AppTextFormField(
            isObscureText: _obscureText,
            hintText: 'Password',
            controller: cubit.passwordController,
            validator: (p0) {
              if (p0 == null || p0.isEmpty) return "please enter your password";
              if (p0.length < 6) return "password is less than 6 character";
              return null;
            },
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: ColorsManager.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

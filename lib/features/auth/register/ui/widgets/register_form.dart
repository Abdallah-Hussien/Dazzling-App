import 'package:dazzling/core/helper/spacing.dart';
import 'package:dazzling/core/theme/colors.dart';
import 'package:dazzling/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          AppTextFormField(hintText: 'Name', validator: (p0) {}),
          Spacing.vertical(16),
          AppTextFormField(
            hintText: 'Email@example.com',
            validator: (p0) {},
            inputType: TextInputType.emailAddress,
          ),
          Spacing.vertical(16),
          AppTextFormField(
            isObscureText: _obscureText,
            hintText: 'Password',
            validator: (p0) {},
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

import 'package:dazzling/core/helper/spacing.dart';
import 'package:dazzling/core/theme/colors.dart';
import 'package:dazzling/core/theme/font_weight_helper.dart';
import 'package:dazzling/core/widgets/app_text_button.dart';
import 'package:dazzling/features/auth/register/logic/register_cubit.dart';
import 'package:dazzling/features/auth/register/ui/widgets/register_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/routing/routes_names.dart';
import 'widgets/already_have_account.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterCubit(),

      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            final name = FirebaseAuth.instance.currentUser?.displayName ?? '';
            Navigator.pushReplacementNamed(
              context,
              RoutesNames.home,
              arguments: name,
            );
          } else if (state is RegisterFailure){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: ColorsManager.primary,
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 24.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacing.vertical(70),
                    SvgPicture.asset('assets/svg/hungery.svg'),
                    Text(
                      'Create a new account and start your journey with us.',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeightHelper.regular,
                        color: Colors.white,
                      ),
                    ),
                    Spacing.vertical(60),
                    RegisterForm(),
                    Spacing.vertical(30),
                    state is RegisterLoading ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ) :
                    AppTextButton(
                      buttonText: 'Sign up',
                      textStyle: TextStyle(
                        color: ColorsManager.primary,
                        // fontSize: 13.sp,
                        fontWeight: FontWeightHelper.medium,
                      ),
                      onPressed: () {
                        context
                            .read<RegisterCubit>()
                            .emitRegisterStates();
                      },
                    ),
                    Spacing.vertical(60),
                    AlreadyHaveAccount(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

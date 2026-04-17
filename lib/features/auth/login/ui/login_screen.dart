import 'package:dazzling/core/helper/spacing.dart';
import 'package:dazzling/core/theme/colors.dart';
import 'package:dazzling/core/theme/font_weight_helper.dart';
import 'package:dazzling/core/widgets/app_text_button.dart';
import 'package:dazzling/features/auth/login/ui/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../logic/cubit/login_cubit.dart';
import 'widgets/donot_have_account.dart';
import 'widgets/login_bloc_listener.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primary,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 24.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacing.vertical(90),
              SvgPicture.asset('assets/svg/hungery.svg'),
              Spacing.vertical(10),

              Text(
                'Welcome back! Please login to your account.',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeightHelper.regular,
                  color: Colors.white,
                ),
              ),
              Spacing.vertical(60),
              LoginForm(),
              Spacing.vertical(30),
              AppTextButton(
                buttonText: 'Login',
                textStyle: TextStyle(
                  color: ColorsManager.primary,
                  // fontSize: 13.sp,
                  fontWeight: FontWeightHelper.medium,
                ),
                onPressed: () {
                  if (context
                      .read<LoginCubit>()
                      .formKey
                      .currentState!
                      .validate()) {
                    context.read<LoginCubit>().emitLoginStates();
                  }
                },
              ),
              Spacing.vertical(60),
              DoNotHaveAccount(),
              LoginBlocListener(),
            ],
          ),
        ),
      ),
    );
  }
}

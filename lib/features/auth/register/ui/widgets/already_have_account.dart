import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/routing/routes_names.dart';
import '../../../../../core/theme/font_weight_helper.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account? ',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeightHelper.regular,
            color: Colors.white,
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(padding: EdgeInsets.all(2)),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Login',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeightHelper.medium,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

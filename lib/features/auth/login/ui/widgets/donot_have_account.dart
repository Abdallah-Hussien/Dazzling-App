
import 'package:dazzling/core/routing/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/font_weight_helper.dart';

class DoNotHaveAccount extends StatelessWidget {
  const DoNotHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account? ',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeightHelper.regular,
            color: Colors.white,
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(padding: EdgeInsets.all(2)),
          onPressed: () {
            Navigator.of(context).pushNamed(RoutesNames.register);
          },
          child: Text(
            'Sign up',
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

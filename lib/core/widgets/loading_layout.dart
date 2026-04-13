import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../theme/colors.dart';

class LoadingLayout {
  LoadingLayout._();
  static dynamic setupLogin(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      barrierColor: ColorsManager.white.withOpacity(0.8),
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: Lottie.asset(
            'assets/lottie/loading.json',
            width: 250,
            height: 250,
          ),
        );
      },
    );
  }
}

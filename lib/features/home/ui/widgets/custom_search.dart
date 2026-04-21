import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/app_text_form_field.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: AppTextFormField(
        radius: 18.0,
        prefixIcon: const Icon(Icons.search, size: 25, color: Colors.black87),
        backgroundColor: Colors.white,
        // controller: controller,
        hintText: 'Search for food...',
        validator: (value) {},
      ),
    );
  }
}

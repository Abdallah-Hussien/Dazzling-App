
import 'package:dazzling/core/helper/spacing.dart';
import 'package:dazzling/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theme/font_weight_helper.dart';
import 'widgets/categories_list/categories_bloc_builder.dart';
import 'widgets/custom_search.dart';
import 'widgets/selected_category/selected_categories_bloc_builder.dart';

class HomeScreen extends StatelessWidget {
  final String name;
  const HomeScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacing.vertical(30),
            SvgPicture.asset(
              'assets/svg/hungery.svg',
              color: ColorsManager.primary,
            ),
            Spacing.vertical(10),
            Text(
              'Hello, $name!',
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeightHelper.regular,
              ),
            ),
            Spacing.vertical(30.h),
            const CustomSearch(),
            Spacing.vertical(16),
            Expanded(
              child: Column(
                children: [
                  const CategoriesBlocBuilder(),
                  Spacing.vertical(16),
                  const SelectedCategoriesBlocBuilder(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

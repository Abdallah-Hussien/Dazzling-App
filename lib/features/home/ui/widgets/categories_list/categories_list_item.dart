import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/colors.dart';

class CategoriesListItem extends StatelessWidget {
  const CategoriesListItem({
    super.key,
    required this.selectedCategoryIndex,
    required this.index,
    required this.text,
  });

  final int index;
  final int selectedCategoryIndex;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      margin: (index != 0) ? EdgeInsetsDirectional.only(start: 12.w) : null,
      decoration: BoxDecoration(
        boxShadow: index == selectedCategoryIndex
            ? [
                BoxShadow(
                  color: ColorsManager.primary.withOpacity(0.5),
                  blurRadius: 5,
                  offset: const Offset(0, 1),
                ),
              ]
            : null,
        color: selectedCategoryIndex == index
            ? ColorsManager.primary
            : ColorsManager.moreGray,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 13.sp,
              color: selectedCategoryIndex == index
                  ? Colors.white
                  : Colors.black45,
            ),
          ),
        ),
      ),
    );
  }
}

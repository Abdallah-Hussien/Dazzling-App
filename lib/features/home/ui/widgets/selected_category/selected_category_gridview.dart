import 'package:dazzling/features/home/data/models/meal_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'selected_category_gridview_item.dart';

class SelectedCategoryGridView extends StatelessWidget {
  const SelectedCategoryGridView({
    super.key,
    required this.products,
  });

  final List<MealModel> products;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsetsDirectional.symmetric(vertical: 14.0.w),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20.h,
          crossAxisSpacing: 19.w,
          childAspectRatio: 2.13 / 3,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Handle tap event
              // context.pushNamed(
              //   RoutesNames.productDetails,
              //   extra: products[index],
              // );
            },
            child: SelectedCategoryGridViewItem(
              product: products[index],
            ),
          );
        },
      ),
    );
  }
}

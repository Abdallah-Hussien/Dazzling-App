import 'package:cached_network_image/cached_network_image.dart';
import 'package:dazzling/core/helper/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/theme/colors.dart';
import '../../../data/models/meal_model.dart';

class SelectedCategoryGridViewItem extends StatelessWidget {
  const SelectedCategoryGridViewItem({super.key, required this.product});

  final MealModel product;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),

      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 180.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl: product.imageUrl ?? '',
                  placeholder: (context, url) => Center(
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.white,
                      child: const SizedBox(
                        width: double.infinity,
                        height: 150,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Center(
                    child: Center(
                      child: Icon(Icons.error, color: ColorsManager.mainBlue),
                    ),
                  ),
                ),
              ),
            ),
            Spacing.vertical(8),
            Text(
              product.name ?? '',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              '\$${product.price?.toStringAsFixed(2) ?? ''}',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              // style: StyleManager.lightGray12Medium,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              '⭐ 5.2',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              // style: StyleManager.lightGray12Medium,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

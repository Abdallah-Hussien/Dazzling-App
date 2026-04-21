import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesListShimmer extends StatelessWidget {
  const CategoriesListShimmer({super.key});

  @override
  Widget build(BuildContext context){
    return SizedBox(
      height: 60.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 8, // Replace with actual item count
          itemBuilder: (context, index) {
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: 100.w,
                height: 30.h,
                margin: EdgeInsets.only(right: 16.w),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );
          }),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../../logic/cubit/home_cubit.dart';
import '../../../logic/cubit/home_cubit.dart';
import 'categories_list_item.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key, required this.categories});
  final List<String> categories;
  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 7.h),
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories.length, // Replace with actual item count
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategoryIndex = index;
              });
              context.read<HomeCubit>().getSelectedCategoryProducts(
                widget.categories[index],
              );
            },
            child: CategoriesListItem(
              selectedCategoryIndex: selectedCategoryIndex,
              index: index,
              text: widget.categories[index],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../logic/cubit/home_cubit.dart';
import '../../../logic/cubit/home_states.dart';
import 'selected_category_gridview.dart';

class SelectedCategoriesBlocBuilder extends StatelessWidget {
  const SelectedCategoriesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listenWhen: (previous, current) {
        return current is HomeSelectedCategoryError;
      },
      listener: (context, state) {
        if (state is HomeSelectedCategoryError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },

      buildWhen: (previous, current) {
        return current is HomeSelectedCategoryLoading ||
            current is HomeSelectedCategoryLoaded ||
            current is HomeSelectedCategoryError;
      },
      builder: (context, state) {
        if (state is HomeSelectedCategoryLoading) {
          return Center(
            child: Lottie.asset(
              'assets/lottie/loading.json',
              width: 250,
              height: 250,
            ),
          );
        }
        if (state is HomeSelectedCategoryError) {
          return const SelectedCategoryGridView(products: []);
        }
        if (state is HomeSelectedCategoryLoaded) {
          return SelectedCategoryGridView(products: state.selectedCategory);
        }
        return const SizedBox.shrink();
      },
    );
  }
}

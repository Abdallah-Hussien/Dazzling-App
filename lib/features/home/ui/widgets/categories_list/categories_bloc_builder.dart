import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/cubit/home_cubit.dart';
import '../../../logic/cubit/home_states.dart';
import 'categories_list.dart';
import 'categories_list_shimmer.dart';

class CategoriesBlocBuilder extends StatelessWidget {
  const CategoriesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listenWhen: (previous, current) {
        return current is HomeError;
      },
      listener: (context, state) {
        if (state is HomeError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      buildWhen: (previous, current) => current is HomeLoading ||
          current is HomeCategoriesLoaded ||
          current is HomeError,
      builder: (context, state) {
        if (state is HomeLoading) {
          return const CategoriesListShimmer();
        }
        if (state is HomeError) {
          return  CategoriesList(categories:[]);
        }
        if (state is HomeCategoriesLoaded) {
          return CategoriesList(categories: state.categories);
        }
        return const SizedBox.shrink();
      },
    );
  }
}

import 'dart:math';

import 'package:dazzling/features/home/data/models/meal_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_states.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<String> categories = [];
  void getHomeCategories() async {
    emit(HomeLoading());
    // emit(HomeSelectedCategoryLoading());
    try {
      // Simulate fetching categories from an API or database
      await Future.delayed(const Duration(seconds: 3), () {
        categories = ['All', 'Pizza', 'Burger', 'Sushi', 'Desserts'];
        getSelectedCategoryProducts('All');
        emit(HomeCategoriesLoaded(categories));
      });
      // emit(HomeSelectedCategoryLoaded(categories));
    } catch (e) {
      emit(HomeError('Failed to load categories'));
    }
  }

  void getSelectedCategoryProducts(String category) async {
    emit(HomeSelectedCategoryLoading());
    try {
      // Simulate fetching products for the selected category
      await Future.delayed(const Duration(seconds: 1), () {
        // Here you would typically fetch products based on the category
        // For demonstration, we'll just create a list of dummy products
        emit(HomeSelectedCategoryLoaded(meals));
      });
    } catch (e) {
      emit(HomeSelectedCategoryError('Failed to load products for $category'));
    }
  }
}

import 'dart:math';

import 'package:dazzling/features/home/data/models/meal_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/home_repo.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.homeRepo}) : super(HomeInitial());
  final HomeRepo homeRepo;

  List<String> categories = [];
  void getHomeCategories() async {
    emit(HomeLoading());
    try {
      categories = await homeRepo.getHomeCategories();
      emit(HomeCategoriesLoaded(categories));
      getSelectedCategoryProducts(categories.first);
    } catch (e) {
      emit(HomeError('Failed to load categories'));
    }
  }

  void getSelectedCategoryProducts(String category) async {
    emit(HomeSelectedCategoryLoading());
    try {
      final meals = await homeRepo.getSelectedCategoryProducts(category);
      emit(HomeSelectedCategoryLoaded(meals));
    } catch (e) {
      emit(HomeSelectedCategoryError('Failed to load products for $category'));
    }
  }
}

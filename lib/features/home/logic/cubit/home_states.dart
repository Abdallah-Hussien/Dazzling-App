import '../../data/models/meal_model.dart';

sealed class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}

class HomeCategoriesLoaded extends HomeState {
  final List<String> categories;

  HomeCategoriesLoaded(this.categories);
}


class HomeSelectedCategoryLoading extends HomeState {}

class HomeSelectedCategoryError extends HomeState {
  final String message;

  HomeSelectedCategoryError(this.message);
}
class HomeSelectedCategoryLoaded extends HomeState {
  final List<MealModel> selectedCategory;

  HomeSelectedCategoryLoaded(this.selectedCategory);


}

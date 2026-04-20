import '../../../../core/networking/api_services.dart';
import '../models/meal_model.dart';

class HomeRepo {
  final ApiServices apiServices;
  HomeRepo({required this.apiServices});

  Future<List<String>> getHomeCategories() async {
    try {
      final categories = await apiServices.getCategories();
      return categories;
    } catch (e) {
      throw Exception('Failed to load categories: $e');
    }
  }
  
  Future<List<MealModel>> getSelectedCategoryProducts(String category) async {
    try {
      final meals = await apiServices.getMealsByCategory(category);
      return meals;
    } catch (e) {
      throw Exception('Failed to load meals for category $category: $e');
    }
  }
}
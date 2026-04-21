import 'dart:developer';
import 'dart:math' show Random;

import 'package:dio/dio.dart';

import '../../features/home/data/models/meal_model.dart';

class ApiServices {
  final String baseUrl = 'https://www.themealdb.com/api/json/v1/1';
  final Dio dio;
  ApiServices({required this.dio});

  Future<List<String>> getCategories() async {
    try {
      final response = await dio.get('$baseUrl/categories.php');
      if (response.statusCode == 200) {
        final data = response.data['categories'] as List;
        final categories = data
            .map((category) => category['strCategory'] as String)
            .toList();
        log('From ApiServices Categories: $categories');
        return categories;
      } else {
        log('From ApiServices Categories: ${response.statusCode}');
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      log('From ApiServices Categories: $e');
      throw Exception('Failed to load categories: $e');
    }
  }

  Future<List<MealModel>> getMealsByCategory(String category) async {
    try {
      final response = await dio.get('$baseUrl/filter.php?c=$category');
      if (response.statusCode == 200) {
        final data = response.data['meals'] as List;
        final meals = data
            .map(
              (meal) => MealModel(
                id: meal['idMeal'] as String,
                name: meal['strMeal'] as String,
                imageUrl: meal['strMealThumb'] as String,
                price: Random().nextDouble() * 20 + 5, // Random price for demonstration
              ),
            )
            .toList();
        log('From ApiServices Meals: $meals');
        return meals;
      } else {
        log('From ApiServices Meals: ${response.statusCode}');
        throw Exception('Failed to load meals for category $category');
      }
    } catch (e) {
      log('From ApiServices Meals: $e');
      throw Exception('Failed to load meals for category $category: $e');
    }
  }
}

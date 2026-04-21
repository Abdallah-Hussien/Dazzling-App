
import 'dart:convert';

class MealModel {
  final String? id;
  final String? name;
  final String? description;
  final double? price;
  final String? imageUrl;

  MealModel({
    required this.id,
    required this.name,
    this.description,
    this.price,
    required this.imageUrl,
  });


  MealModel copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    String? imageUrl,
  }) {
    return MealModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }


  factory MealModel.fromMap(Map<String, dynamic> map) {
    return MealModel(
      id: map['idMeal'] != null ? map['idMeal'] as String : null,
      name: map['strMeal'] != null ? map['strMeal'] as String : null,
      imageUrl: map['strMealThumb'] != null ? map['strMealThumb'] as String : null,
    );
  }

  factory MealModel.fromJson(String source) => MealModel.fromMap(json.decode(source) as Map<String, dynamic>);

}

final List<MealModel> meals = [
  MealModel(
    id: '1',
    name: 'Burger',
    description: 'A delicious beef burger with cheese and lettuce.',
    price: 5.99,
    imageUrl:
        'https://static01.nyt.com/images/2025/07/25/multimedia/kla-diner-style-burger-fkmj/kla-diner-style-burger-fkmj-mediumSquareAt3X.jpg',
  ),
  MealModel(
    id: '2',
    name: 'Pizza',
    description: 'A classic pepperoni pizza with a crispy crust.',
    price: 8.99,
    imageUrl:
        'https://static01.nyt.com/images/2025/07/25/multimedia/kla-diner-style-burger-fkmj/kla-diner-style-burger-fkmj-mediumSquareAt3X.jpg',
  ),
  MealModel(
    id: '3',
    name: 'Sushi',
    description: 'Fresh sushi rolls with salmon and avocado.',
    price: 12.99,
    imageUrl:
        'https://static01.nyt.com/images/2025/07/25/multimedia/kla-diner-style-burger-fkmj/kla-diner-style-burger-fkmj-mediumSquareAt3X.jpg',
  ),

  MealModel(
    id: '4',
    name: 'Burger',
    description: 'A delicious beef burger with cheese and lettuce.',
    price: 5.99,
    imageUrl:
        'https://static01.nyt.com/images/2025/07/25/multimedia/kla-diner-style-burger-fkmj/kla-diner-style-burger-fkmj-mediumSquareAt3X.jpg',
  ),
  MealModel(
    id: '5',
    name: 'Pizza',
    description: 'A classic pepperoni pizza with a crispy crust.',
    price: 8.99,
    imageUrl:
        'https://static01.nyt.com/images/2025/07/25/multimedia/kla-diner-style-burger-fkmj/kla-diner-style-burger-fkmj-mediumSquareAt3X.jpg',
  ),
  MealModel(
    id: '6',
    name: 'Sushi',
    description: 'Fresh sushi rolls with salmon and avocado.',
    price: 12.99,
    imageUrl:
        'https://static01.nyt.com/images/2025/07/25/multimedia/kla-diner-style-burger-fkmj/kla-diner-style-burger-fkmj-mediumSquareAt3X.jpg',
  ),
];

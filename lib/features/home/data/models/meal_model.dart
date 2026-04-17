class MealModel {
  final String? id;
  final String? name;
  final String? description;
  final double? price;
  final String? imageUrl;

  MealModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
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

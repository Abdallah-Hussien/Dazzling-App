class ToppingItem {
  final String name;
  final String imagePath;
  final double price;
  bool selected;

  ToppingItem({
    required this.name,
    required this.imagePath,
    required this.price,
    this.selected = false,
  });
}

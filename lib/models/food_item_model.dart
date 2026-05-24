class FoodItemModel {
  final String name;
  final String imageUrl;
  final double price;
  final bool isFavorite;

  FoodItemModel({
    required this.name,
    required this.imageUrl,
    required this.price,
    this.isFavorite = false,
  });

  FoodItemModel copyWith({
    String? name,
    String? imageUrl,
    double? price,
    bool? isFavorite,
  }) {
    return FoodItemModel(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

List<FoodItemModel> food = [
  FoodItemModel(
    name: 'Beef Burger',
    imageUrl: 'assets/images/categories/burger.png',
    price: 8.5,
  ),
  FoodItemModel(
    name: 'Pizza',
    imageUrl: 'assets/images/categories/pizza.png',
    price: 9,
  ),
  FoodItemModel(
    name: 'Pasta',
    imageUrl: 'assets/images/categories/pasta.png',
    price: 7.5,
  ),
];

class FoodItem {
  final int id;
  final String image;
  final String title;
  final String subtitle;
  bool isAddedToCart;

  FoodItem({
    required this.id,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.isAddedToCart,
  });

  static final List<FoodItem> foodItems = [
    for (int i = 0; i < 100; i++)
      FoodItem(
        id: i,
        image: 'assets/images/image_1.avif',
        title: _getFoodTitle(i),
        subtitle: _getFoodDescription(i),
        isAddedToCart: false,
      ),
  ];

  static String _getFoodTitle(int index) {
    final foodNames = [
      'Burger', 'Pizza', 'Pasta', 'Salad', 'Sandwich',
      'Sushi', 'Taco', 'Curry', 'Steak', 'Soup'
    ];

    return '${foodNames[index % foodNames.length]} ${(index ~/ foodNames.length) + 1}';
  }

  static String _getFoodDescription(int index) {
    final descriptions = [
      'Delicious meal with special sauce',
      'Fresh ingredients and amazing taste',
      'Chef\'s special recommendation',
      'Popular choice among customers',
      'Traditional recipe with modern twist'
    ];

    return descriptions[index % descriptions.length];
  }
}

class CartModel {
  int quantity;
  final String title;
  final String desc;
  final String image;
  final double price;

  final int id;

   CartModel({
    required this.id,
    required this.quantity,
    required this.title,
    required this.desc,
    required this.image,
    required this.price,
  });

  // copyWith

  CartModel copyWith({
    int? quantity,
    String? title,
    String? desc,
    String? image,
    int? id,
    double? price,
  }) {
    return CartModel(
      id: id ?? this.id,
      title: title ?? this.title,
      desc: desc ?? this.desc,
      image: image ?? this.image,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
    );
  }
}

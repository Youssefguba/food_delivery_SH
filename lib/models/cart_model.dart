class CartModel {
  final int quantity;
  final String title;
  final String desc;
  final String image;
  final int id;

  const CartModel({
    required this.id,
    required this.quantity,
    required this.title,
    required this.desc,
    required this.image,
  });
}

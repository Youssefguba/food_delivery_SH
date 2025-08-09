import 'package:flutter/foundation.dart';
import 'package:food_delivery/models/cart_model.dart';

class CartController extends ChangeNotifier {
  List<CartModel> cartItems = [];

  void addItemToCart(CartModel item) {
    cartItems.add(item);
    notifyListeners(); // setState
  }
}
import 'package:flutter/foundation.dart';
import 'package:food_delivery/models/cart_model.dart';

class CartController extends ChangeNotifier {
  List<CartModel> cartItems = [];

  // Show snack-bar if item is added
  void addItemToCart(CartModel item) {
    cartItems.add(item);
    notifyListeners(); // setState
  }

  void removeItemFromCart(CartModel item) {
    cartItems.removeWhere((element) => element.id  == item.id);
    notifyListeners();
  }

  // Add, Minus quantity of product

  // Calculate Subtotal of Order

  // Calculate Total Order ( Sub, Delivery, Tax)

  // if Minus equal zero remove the item from cart

  // BONUS :: if goes to checkout, reset the cart items

}

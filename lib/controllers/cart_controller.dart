import 'package:flutter/foundation.dart';
import 'package:food_delivery/models/cart_model.dart';

class CartController extends ChangeNotifier {
  List<CartModel> cartItems = [];

  double _subtotal = 0.0;

  double _total = 0.0;

  double get total => _total;

  double get subtotal => _subtotal;

  double get delivery => 25.0;

  double get tax => 14.0;

  // Show snack-bar if item is added
  void addItemToCart(CartModel item) { 
    cartItems.add(item);
    calculateSubtotal();
    calcTotalOrder();
    notifyListeners(); // setState
  }

  void removeItemFromCart(CartModel item) {
    cartItems.removeWhere((element) => element.id == item.id);

    // TODO: Change isAddedToCart to false (TASK)

    calculateSubtotal();
    calcTotalOrder();
    notifyListeners();
  }

  // Add, Minus quantity of product
  void addOneItem(CartModel item) {
    CartModel cartItem = cartItems.firstWhere(
      (element) => element.id == item.id,
    );

    // cartItem = cartItem.copyWith(quantity: cartItem.quantity + 1);

    if (cartItem.quantity >= 100) return;

    cartItem.quantity += 1;

    calculateSubtotal();
    calcTotalOrder();

    notifyListeners();
  }

  void minusOneItem(CartModel item) {
    CartModel cartItem = cartItems.firstWhere(
      (element) => element.id == item.id,
    );

    // cartItem = cartItem.copyWith(quantity: cartItem.quantity + 1);

    // if Minus equal zero remove the item from cart
    if (cartItem.quantity < 1) {
      removeItemFromCart(item);
      return;
    }

    cartItem.quantity -= 1;

    calculateSubtotal();
    calcTotalOrder();
    notifyListeners();
  }

  // Calculate Subtotal of Order
  void calculateSubtotal() {
    double subtotal = 0.0;
    for (final item in cartItems) {
      subtotal += item.price * item.quantity;
    }

    _subtotal = subtotal;
  }

  // Calculate Total Order ( Sub, Delivery, Tax)
  void calcTotalOrder() {
    _total = _subtotal + delivery + (_subtotal * tax / 100);
  }

  void checkout() {
    if (cartItems.isNotEmpty) {
      // Navigate to checkout screen
      cartItems.clear();
      notifyListeners();
    }
  }

  // BONUS :: if goes to checkout, reset the cart items
}

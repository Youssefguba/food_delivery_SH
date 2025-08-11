import 'package:flutter/material.dart';
import 'package:food_delivery/models/cart_model.dart';

class CartItemWidget extends StatelessWidget {
  final CartModel cartItem;
  const CartItemWidget({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(cartItem.title),
      subtitle: Text(cartItem.desc),
      leading: Image.asset(
        cartItem.image,
        height: 70,
        width: 70,
      ),
      trailing: Row(
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
          Text('1'),
          IconButton(onPressed: () {}, icon: Icon(Icons.remove)),
        ],
      ),
    );
  }
}

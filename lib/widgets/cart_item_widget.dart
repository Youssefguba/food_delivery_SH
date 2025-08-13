import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:provider/provider.dart';

class CartItemWidget extends StatelessWidget {
  final CartModel cartItem;
  const CartItemWidget({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(cartItem.title),
      subtitle: Text(cartItem.desc),
      leading: Image.asset(cartItem.image, height: 70, width: 70),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              Provider.of<CartController>(context, listen: false).addOneItem(cartItem);
              // setState();
            },
            icon: Icon(Icons.add),
          ),
          Text(cartItem.quantity.toString()),
          IconButton(onPressed: () {
            Provider.of<CartController>(context, listen: false).minusOneItem(cartItem);

          }, icon: Icon(Icons.remove)),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Burger'),
      subtitle: Text('Beef Burger'),
      leading: Image.network(
        'https://www.realsimple.com/thmb/z3cQCYXTyDQS9ddsqqlTVE8fnpc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/real-simple-mushroom-black-bean-burgers-recipe-0c365277d4294e6db2daa3353d6ff605.jpg',
        height: 70,
        width: 70,
      ),
      trailing: Text('Button'),
    );
  }
}

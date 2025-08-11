import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/widgets/cart_item_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context, listen: false);
    // final cartController = CartController();

    if (cartController.cartItems.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/lottie/empty.json', height: 200, width: 200),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'There is no Item in Cart, Please Discover and return here after add items',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          // items widgets
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.5,
            child: ListView.builder(
              itemCount: cartController.cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = cartController.cartItems[index];
                return CartItemWidget(cartItem: cartItem);
              },
            ),
          ),

          // orders details
          ListTile(title: Text('Subtotal'), trailing: Text('\$25.00')),

          ListTile(title: Text('Delivery Fee'), trailing: Text('\$25.00')),

          ListTile(title: Text('Tax'), trailing: Text('\$25.00')),

          ListTile(title: Text('Total'), trailing: Text('\$25.00')),

          // checkout button
          // TextButton(onPressed: () {}, child: Text('Checkout')),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xffE82933),
              fixedSize: Size(348, 48),
            ),
            child: Text('Checkout', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

// TODO: Sizer Package

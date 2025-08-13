import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/widgets/cart_item_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

// Global Variables

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final cartController = Provider.of<CartController>(context, listen: false);
    // final cartController = CartController();


    return Consumer<CartController>(
      builder: (BuildContext context, cart, Widget? child) {

        if (cart.cartItems.isEmpty) {
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
                  itemCount: cart.cartItems.length,
                  itemBuilder: (context, index) {
                    final cartItem = cart.cartItems[index];
                    return CartItemWidget(cartItem: cartItem);
                  },
                ),
              ),

              // orders details
              ListTile(title: Text('Subtotal'), trailing: Text('\$${cart.subtotal}')),

              ListTile(title: Text('Delivery Fee'), trailing: Text('\$${cart.delivery}')),

              ListTile(title: Text('Tax'), trailing: Text('%${cart.tax}')),

              ListTile(title: Text('Total'), trailing: Text('\$${cart.total.toStringAsFixed(2)}')),

              // checkout button
              // TextButton(onPressed: () {}, child: Text('Checkout')),
              ElevatedButton(
                onPressed: () {
                  Provider.of<CartController>(context, listen: false).checkout();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffE82933),
                  fixedSize: Size(348, 48),
                ),
                child: Text('Checkout', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        );
      },
    );
  }
}

// TODO: Sizer Package
// TODO: Child in Consumer

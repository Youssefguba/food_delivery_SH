import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/cart_item_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // items widgets
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.5,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return CartItemWidget();
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

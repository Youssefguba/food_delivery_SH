import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:provider/provider.dart';

import '../models/food_item.dart';

class ProductsListWidget extends StatefulWidget {
  const ProductsListWidget({super.key});

  @override
  State<ProductsListWidget> createState() => _ProductsListWidgetState();
}

class _ProductsListWidgetState extends State<ProductsListWidget> {
  @override
  Widget build(BuildContext context) {
    return _buildProducts();
  }

  Widget _buildProducts() {
    return ListView.builder(
      itemCount: FoodItem.foodItems.length,
      itemBuilder: (context, index) {
        final item = FoodItem.foodItems[index];
        return _buildProductItem(item);
      },
    );
  }

  Widget _buildProductItem(FoodItem item) {
    return ListTile(
      leading: Container(
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage(item.image),
            fit: BoxFit.cover,
          ),
        ),
      ),
      trailing: GestureDetector(
        onTap: () {
          // Clean Code Principles:
          // 1. Start with Positive
          final cartItem = CartModel(
            id: item.id,
            quantity: 1,
            title: item.title,
            desc: item.subtitle,
            image: item.image,
          );

          if (item.isAddedToCart) {
            // remove
            Provider.of<CartController>(
              context,
              listen: false,
            ).removeItemFromCart(cartItem);
          } else {
            Provider.of<CartController>(
              context,
              listen: false,
            ).addItemToCart(cartItem);
          }

          setState(() {
            item.isAddedToCart = !item.isAddedToCart;
          });
        },
        child: _buildListButton(
          text: item.isAddedToCart ? 'Remove from Cart' : 'Add to Cart',
          textColor: item.isAddedToCart ? Colors.red : Colors.black,
          color: item.isAddedToCart ? Colors.white : Color(0xfff3e7e8),
        ),
      ),
      title: Text(item.title),
      subtitle: Text(item.subtitle),
    );
  }

  Widget _buildListButton({
    required String text,
    required Color color,
    required Color textColor,
  }) {
    return Container(
      margin: EdgeInsetsDirectional.only(start: 16),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: color, // TODO (Youssef) : Explain this later
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
        ), // TODO (Youssef): Use Font Family
      ),
    );
  }
}

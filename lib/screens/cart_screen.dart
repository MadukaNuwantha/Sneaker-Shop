import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/models/cart_model.dart';
import 'package:sneaker_shop/models/shoe_model.dart';
import 'package:sneaker_shop/widgets/cart_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //   heading
            const Text(
              'My Cart',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: value.cartItems.length,
                itemBuilder: (context, index) {
                  //   get each shoe
                  Shoe eachShoe = value.getCartShoes[index];
                  //   return cart item
                  return CartItem(shoe: eachShoe);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

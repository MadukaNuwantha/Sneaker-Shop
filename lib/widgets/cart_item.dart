import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/models/cart_model.dart';
import 'package:sneaker_shop/models/shoe_model.dart';

class CartItem extends StatelessWidget {
  final Shoe shoe;
  const CartItem({
    super.key,
    required this.shoe,
  });

  @override
  Widget build(BuildContext context) {
    void removeItemFromCart() {
      Provider.of<Cart>(context, listen: false).removeItemFromCart(shoe);
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        leading: Image.asset(
          shoe.imagePath,
        ),
        title: Text(
          shoe.name,
        ),
        subtitle: Text(
          '\$${shoe.price}',
        ),
        trailing: IconButton(
          onPressed: removeItemFromCart,
          icon: const Icon(
            Icons.delete,
          ),
        ),
      ),
    );
  }
}

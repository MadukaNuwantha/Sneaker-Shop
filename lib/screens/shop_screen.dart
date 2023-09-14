import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/models/cart_model.dart';
import 'package:sneaker_shop/models/shoe_model.dart';
import 'package:sneaker_shop/widgets/shoe_tile.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  void addToCart(Shoe shoe) {
    // add to cart method
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    //   show successful dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor:
            Colors.transparent, // Set background color to transparent
        elevation: 0, // Remove the shadow
        content: Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(12), // Set the border radius
          ),
          child: const Padding(
            padding: EdgeInsets.all(25.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Successfully added to cart',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                // Add other content here if needed
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          //   search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              style: const TextStyle(
                color: Colors.grey,
              ),
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 12.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                suffixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                hintText: 'Search',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),

          //   message
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Text(
              'everyone flies... some fly longer than others',
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),
          ),

          //   top picks
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Hot Picks🔥',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                Shoe eachShoe = value.getShopShoes[index];
                return ShoeTile(
                  shoe: eachShoe,
                  onTap: () => addToCart(eachShoe),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 25.0,
              left: 25.0,
              right: 25.0,
            ),
            child: Divider(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

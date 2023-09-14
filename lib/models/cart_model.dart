import 'package:flutter/material.dart';
import 'package:sneaker_shop/models/shoe_model.dart';

class Cart extends ChangeNotifier {
//   list of shoes for sale
  List<Shoe> shopShoes = [
    Shoe(
      name: 'Zoom FREAK',
      price: '236',
      imagePath: 'assets/shoe-one.png',
      description: 'The forward-thinking design of his latest signature shoe',
    ),
    Shoe(
      name: 'Air Jordans',
      price: '220',
      imagePath: 'assets/shoe-two.png',
      description: 'The forward-thinking design of his latest signature shoe',
    ),
    Shoe(
      name: 'KD Treys',
      price: '240',
      imagePath: 'assets/shoe-three.png',
      description: 'The forward-thinking design of his latest signature shoe',
    ),
    Shoe(
      name: 'Kyrie 6',
      price: '190',
      imagePath: 'assets/shoe-four.png',
      description: 'The forward-thinking design of his latest signature shoe',
    ),
  ];

// list of items in the cart
  List<Shoe> cartItems = [];

// get the list of shoes
  List<Shoe> get getShopShoes => shopShoes;

// get the items in the cart
  List<Shoe> get getCartShoes => cartItems;

// add items to the cart
  void addItemToCart(Shoe shoe) {
    cartItems.add(shoe);
    notifyListeners();
  }

// remove items from the cart
  void removeItemFromCart(Shoe shoe) {
    cartItems.remove(shoe);
    notifyListeners();
  }
}

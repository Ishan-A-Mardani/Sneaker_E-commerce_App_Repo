import 'package:flutter/material.dart';
import 'package:sneaker_shop/models/shoe.dart';

class Cart extends ChangeNotifier {
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Nike Air Max 270',
      description:
          'The Nike Air Max 270 is a new lifestyle shoe that features Nike\'s tallest Air unit yet. The Air Max 270 is inspired by two icons of big Air: the Air Max 180 and Air Max 93.',
      imagePath: 'lib/images/Nike-Air-Max-270.png',
      price: "₹14,499.00",
    ),
    Shoe(
      name: 'Black Sneakers',
      description:
          'The Nike Air Max 270 is a new lifestyle shoe that features Nike\'s tallest Air unit yet. The Air Max 270 is inspired by two icons of big Air: the Air Max 180 and Air Max 93.',
      imagePath: 'lib/images/black-MODEL.png',
      price: "₹14,499.00",
    ),
    Shoe(
      name: 'Misfit Sneakers',
      description:
          'The Nike Air Max 270 is a new lifestyle shoe that features Nike\'s tallest Air unit yet. The Air Max 270 is inspired by two icons of big Air: the Air Max 180 and Air Max 93.',
      imagePath: 'lib/images/MisfitSneakers_Whitegreyorange-side.png',
      price: "₹14,499.00",
    ),
    Shoe(
      name: 'Nike RTFKT',
      description:
          'The Nike Air Max 270 is a new lifestyle shoe that features Nike\'s tallest Air unit yet. The Air Max 270 is inspired by two icons of big Air: the Air Max 180 and Air Max 93.',
      imagePath: 'lib/images/Nike-RTFKT.png',
      price: "₹14,499.00",
    ),
  ];

  Map<Shoe, int> userCartQuantity = {};
  List<Shoe> userCart = [];

  List<Shoe> getShoeShop() {
    return shoeShop;
  }

  List<Shoe> getUserCart() {
    return userCart;
  }

  int? getQuantity(Shoe shoe) {
    if (userCartQuantity.containsKey(shoe)) {
      return userCartQuantity[shoe];
    } else {
      return 0;
    }
  }

  void incrementQuantity(Shoe shoe) {
    userCartQuantity.update(shoe, (value) => value + 1);
    notifyListeners();
  }

  void decrementQuantity(Shoe shoe) {
    userCartQuantity.update(shoe, (value) => value - 1);
    notifyListeners();
  }

  void addToCart(Shoe shoe) {
    userCart.add(shoe);
    userCartQuantity[shoe] = 1;
    notifyListeners();
  }

  void removeFromCart(Shoe shoe) {
    userCart.remove(shoe);
    userCartQuantity.remove(shoe);
    notifyListeners();
  }
}

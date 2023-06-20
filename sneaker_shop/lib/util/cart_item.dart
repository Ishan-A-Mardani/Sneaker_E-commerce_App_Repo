import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import '../models/shoe.dart';

class CartItem extends StatefulWidget {
  Shoe shoe;
  CartItem({super.key, required this.shoe});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade200,
      margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Consumer<Cart>(
        builder: (context, value, child) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(widget.shoe.imagePath,
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width * 0.25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    Text(widget.shoe.name),
                    Text(widget.shoe.price),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.grey.shade500,
                      ),
                      onPressed: () => {value.incrementQuantity(widget.shoe)},
                    ),
                    Text(value.getQuantity(widget.shoe).toString()),
                    (value.getQuantity(widget.shoe) == 1)
                        ? IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.grey.shade500,
                            ),
                            onPressed: () =>
                                {value.removeFromCart(widget.shoe)},
                          )
                        : IconButton(
                            icon: Icon(
                              Icons.remove,
                              color: Colors.grey.shade500,
                            ),
                            onPressed: () =>
                                {value.decrementQuantity(widget.shoe)},
                          ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

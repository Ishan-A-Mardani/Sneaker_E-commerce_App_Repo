import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import '../models/page_index.dart';
import '../models/shoe.dart';
import '../util/cart_item.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My Cart',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.height * 0.035,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          Consumer<Cart>(
            builder: (context, value, child) {
              return (value.getUserCart().isEmpty)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Your Cart is Empty!',
                          style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.022,
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.03),
                        GestureDetector(
                          onTap: () {
                            Provider.of<PageIndex>(context, listen: false)
                                .changePageIndex(0);
                          },
                          child: Text(
                            'Shop Now.',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.022,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: value.getUserCart().length,
                        itemBuilder: (context, index) {
                          Shoe shoe = value.getUserCart()[index];
                          return CartItem(shoe: shoe);
                        },
                      ),
                    );
            },
          )
        ],
      ),
    );
  }
}
                      // child: ListView.builder(
                      //     itemBuilder: (context, index) {
                      //       Shoe shoe = Provider.of<Cart>(context).getUserCart()[index];
                      //       //  Provider.of<Cart>(context).getUserCart();
                      //       return Card(
                      //         child: ListTile(
                      //           leading: Image.asset(shoe.imagePath),
                      //           title: Text(shoe.name),
                      //           // subtitle: Text(shoe.description),
                      //           trailing: Text(shoe.price),
                      //         ),
                      //       );
                      //     },
                      //     itemCount:
                      //         Provider.of<Cart>(context).getUserCart().length),

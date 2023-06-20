import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/models/page_index.dart';
import '../models/cart.dart';
import '../models/shoe.dart';
import '../util/shoe_tile.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addShoeToCart(Shoe shoe, value2) {
    if (Provider.of<Cart>(context, listen: false).getQuantity(shoe) == 0) {
      Provider.of<Cart>(context, listen: false).addToCart(shoe);
    } else {
      Provider.of<Cart>(context, listen: false).incrementQuantity(shoe);
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Successfully Added to Cart'),
        // content: Text('Check your Cart ', textAlign: TextAlign.center),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                style:
                    TextButton.styleFrom(backgroundColor: Colors.grey.shade800),
                child: Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                  child: Text(
                    'Continue Shopping',
                    style: TextStyle(color: Colors.grey.shade100),
                  ),
                ),
              ),
              // ChangeNotifierProvider(
              //   create: (context) => PageIndex(),
              //   builder: (context, child) => TextButton(
              //     onPressed: () {
              //       Navigator.pop(context);
              //       Provider.of<PageIndex>(context, listen: false)
              //           .changePageIndex(1);
              //     },
              //     style: TextButton.styleFrom(
              //         backgroundColor: Colors.grey.shade800),
              //     child: Padding(
              //       padding: EdgeInsets.all(
              //           MediaQuery.of(context).size.width * 0.02),
              //       child: Text(
              //         'Go To Cart',
              //         style: TextStyle(color: Colors.grey.shade100),
              //       ),
              //     ),
              //   ),
              // ),
              // Consumer<PageIndex>(
              // builder: (context, value, child) =>
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  value2.changePageIndex(1);
                },
                style:
                    TextButton.styleFrom(backgroundColor: Colors.grey.shade800),
                child: Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                  child: Text(
                    'Go To Cart',
                    style: TextStyle(color: Colors.grey.shade100),
                  ),
                ),
              ),
              // ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.035),
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.065),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Search',
                    style: TextStyle(
                      color: Colors.grey,
                    )),
                Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.06),
            child: Text('Everyone Flies... Some Fly Longer Than Others',
                style: TextStyle(
                  color: Colors.grey.shade600,
                )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.08),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Hot Picks 🔥',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.075,
                      fontWeight: FontWeight.bold,
                    )),
                Text('See All',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.035,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Consumer<PageIndex>(
            builder: (context, value2, child) => Expanded(
              child: ListView.builder(
                itemCount: value.getShoeShop().length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Shoe shoe = value.getShoeShop()[index];
                  return ShoeTile(
                    shoe: shoe,
                    onTap: () => addShoeToCart(shoe, value2),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.width * 0.06,
                left: MediaQuery.of(context).size.width * 0.06,
                right: MediaQuery.of(context).size.width * 0.06),
            child: Divider(
              color: Colors.grey.shade300,
            ),
          )
        ],
      ),
    );
  }
}

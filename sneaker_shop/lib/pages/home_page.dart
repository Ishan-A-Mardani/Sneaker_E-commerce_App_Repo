import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/page_index.dart';
import '../util/bottom_nav_bar.dart';
import 'package:sneaker_shop/pages/shop_page.dart';
import 'cart_page.dart';
import 'intro_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [
    const ShopPage(),
    const CartPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PageIndex(),
      builder: (context, child) => Scaffold(
        backgroundColor: Colors.grey.shade300,
        bottomNavigationBar: BottomNavBar(
          onTabChange: (index) => Provider.of<PageIndex>(context, listen: false)
              .changePageIndex(index),
        ),
        body: _pages[Provider.of<PageIndex>(context).getPageIndex()],
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Builder(
              builder: (context) => Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.025),
                child: IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
            )),
        drawer: Drawer(
          backgroundColor: Colors.grey.shade900,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // Putting everything in a column except the last logout so that it is at the bottom due to the main axis alignment.
            children: [
              Column(
                children: [
                  DrawerHeader(
                    child: Image.asset(
                      "lib/images/nike-symbol.png",
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.07),
                    child: Divider(color: Colors.grey.shade200),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      top: MediaQuery.of(context).size.width * 0.03,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const IntroPage()),
                            (route) => false);
                      },
                      child: const ListTile(
                        leading: Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Home",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      top: MediaQuery.of(context).size.width * 0.03,
                    ),
                    child: const ListTile(
                      leading: Icon(
                        Icons.info,
                        color: Colors.white,
                      ),
                      title: Text(
                        "About",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                  top: MediaQuery.of(context).size.width * 0.03,
                ),
                child: const ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Logout",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.height * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
                child: Image.asset(
                  'lib/images/nike-symbol.png',
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Text(
                "Just Do It",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.03,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                "Brand New Sneakers and Custom Kicks made with Premium Quality.",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                  color: Colors.grey.shade500,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage())),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(17),
                  ),
                  padding: EdgeInsets.all(
                      MediaQuery.of(context).size.height * 0.0325),
                  child: Center(
                    child: Text(
                      "Shop Now",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
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

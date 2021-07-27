import 'package:flutter/material.dart';
import 'package:flutter_docs/Provider/Model/cart.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int totalPrice = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, value) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Your Cart',
              style: TextStyle(fontSize: 30),
            ),
            centerTitle: true,
            backgroundColor: Colors.pink.shade200,
          ),
          body: Column(
            children: [
              Container(
                width: double.infinity,
                height: 400,
                child: ListView.builder(
                  itemCount: cart.cart.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 70,
                        child: ListTile(
                          subtitle: Text(
                            cart.cart[i].price.toString(),
                          ),
                          leading: Image(
                            image: AssetImage(
                              cart.cart[i].image,
                            ),
                          ),
                          title: Text(cart.cart[i].name),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Text(
                totalPrice.toString(),
              ),
            ],
          ),
        );
      },
    );
  }
}

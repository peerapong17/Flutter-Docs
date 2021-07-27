import 'package:flutter/material.dart';
import 'package:flutter_docs/Provider/Model/cart.dart';
import 'package:provider/provider.dart';
import 'Model/fruit/fruit_model.dart';
import 'Model/fruit/list_fruit.dart';

class ShopingPage extends StatelessWidget {
  const ShopingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Shoping Center',
            style: TextStyle(fontSize: 30),
          ),
          centerTitle: true,
          backgroundColor: Colors.pink.shade200,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: ListView.builder(
            itemCount: listFruit.length,
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 70,
                  child: ListTile(
                    onTap: () {
                      cart.cart.add(
                        Fruit(listFruit[i].name, listFruit[i].image,
                            listFruit[i].price),
                      );
                    },
                    subtitle: Text(
                      listFruit[i].price.toString(),
                    ),
                    trailing: Icon(Icons.plus_one),
                    leading: Image(
                      image: AssetImage(
                        listFruit[i].image,
                      ),
                    ),
                    title: Text(listFruit[i].name),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

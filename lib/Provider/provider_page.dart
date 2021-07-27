import 'package:flutter/material.dart';
import 'package:flutter_docs/Provider/Model/cart.dart';
import 'package:provider/provider.dart';
import 'cart_page.dart';
import 'shoping_page.dart';

class ProviderPage extends StatefulWidget {
  const ProviderPage({Key? key}) : super(key: key);

  @override
  _ProviderPageState createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  List page = [ShopingPage(), CartPage()];
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Cart>(create: (_) => Cart()),
      ],
      child: Scaffold(
        body: page[_currentPage],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'HOME',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'CART',
            ),
          ],
          elevation: 5,
          backgroundColor: Colors.grey.shade300,
          currentIndex: _currentPage,
          selectedItemColor: Colors.blue[800],
          onTap: (value) {
            setState(() {
              _currentPage = value;
            });
          },
        ),
      ),
    );
  }
}

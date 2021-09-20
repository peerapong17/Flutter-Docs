import 'package:flutter/material.dart';
import 'package:flutter_docs/ProviderSection/provider/stateless_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_docs/ProviderSection/provider/stateful_provider.dart';
import 'package:flutter_docs/ProviderSection/stateful_provider.page.dart';
import 'package:flutter_docs/ProviderSection/stateless_provider.page.dart';

class ProviderPage extends StatefulWidget {
  static const routeName = 'Provider';


  @override
  _ProviderPageState createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  int _selectedIndex = 0;
  List<Widget> page = [StatelessProviderPage(), StatefulProviderPage()];
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<StatefulProvider>(
          create: (context) => StatefulProvider(),
        ),
        ChangeNotifierProvider<StatelessProvider>(
          create: (context) => StatelessProvider(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text("Provider"),
          centerTitle: true,
        ),
        body: page[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Stateless Provider',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Stateful Provider',
            ),
          ],
          elevation: 5,
          backgroundColor: Colors.grey.shade300,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue[800],
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
        ),
      ),
    );
  }
}

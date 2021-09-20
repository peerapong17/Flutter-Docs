import 'package:flutter/material.dart';
import 'package:flutter_docs/Steam-Builder/steam_builder_two.dart';
import 'package:flutter_docs/Steam-Builder/steam_builder_one.dart';

class SteamBuilderPage extends StatefulWidget {
  static const routeName = "SteamBuilder";
  @override
  _SteamBuilderPageState createState() => _SteamBuilderPageState();
}

class _SteamBuilderPageState extends State<SteamBuilderPage> {
  int _selectedIndex = 0;

  List<Widget> _page = [SteamBuilderOne(), SteamBuilderTwo()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Steam Builder Section"),
      ),
      body: _page[_selectedIndex],
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
    );
  }
}

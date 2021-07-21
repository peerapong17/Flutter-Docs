import 'package:flutter/material.dart';

import 'counter_one/counter_page.dart';
import 'counter_two/counter_two_page.dart';

class BlocPage extends StatefulWidget {
  const BlocPage({Key? key}) : super(key: key);

  @override
  _BlocPageState createState() => _BlocPageState();
}

class _BlocPageState extends State<BlocPage> {
  List page = [CounterPage(), CounterTwoPage()];
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Section'),
      ),
      body: page[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.plus_one),
            label: '+1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.hdr_plus),
            label: '+2',
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
    );
  }
}

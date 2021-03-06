import 'package:flutter/material.dart';
import 'package:flutter_docs/API/image_api_page.dart';
import 'package:flutter_docs/API/weather_api_page.dart';
import 'package:flutter_docs/Home/my_home_page.dart';

class ApiPage extends StatefulWidget {
  static const routeName = 'Http-Request';


  @override
  _ApiPageState createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  var _selectedIndex = 0;
  List<StatefulWidget> page = [ImageApiPage(), WeatherApiPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'API section',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Color(0xffe196ff),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyHomePage(),
            ),
          ),
        ),
      ),
      body: page[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Picture API',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Weather API',
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

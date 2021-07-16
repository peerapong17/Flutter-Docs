import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_docs/API/api_page.dart';
import 'package:flutter_docs/Authentication/account_page.dart';
import 'package:flutter_docs/Form/form_page.dart';
import 'package:flutter_docs/Home/get_started_page.dart';
import 'package:flutter_docs/Home/section_card.dart';
import 'package:flutter_docs/steam/steam_page.dart';
import '../Grid/grid_page.dart';
import '../ListView/list_view_page.dart';
import '../PopUp/pop_up_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffedb3ff),
        elevation: 0,
        title: Text(
          "Flutter Docs",
          style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 30.0,
              letterSpacing: 2,
              color: Colors.black87),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color(0xffe0e0e0),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SectionCard(
                text: "Get Started",
                color: Color(0xff94ffd8),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContainerPage(),
                  ),
                ),
              ),
              SectionCard(
                text: "API",
                color: Color(0xffe196ff),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ApiPage(),
                  ),
                ),
              ),
              SectionCard(
                text: "Form",
                color: Color(0xff9dff94),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FormPage(),
                  ),
                ),
              ),
              SectionCard(
                text: "SteamBuilder",
                color: Color(0xffffcf94),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SteamPage(),
                  ),
                ),
              ),
              SectionCard(
                text: "ListView",
                color: Color(0xff94ffd8),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListViewPage(),
                  ),
                ),
              ),
              SectionCard(
                text: "Pop Up",
                color: Color(0xff9874f2),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PopUpPage(),
                  ),
                ),
              ),
              SectionCard(
                text: "Grid",
                color: Color(0xffe196ff),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GridPage(),
                  ),
                ),
              ),
              SectionCard(
                text: "Authentication",
                color: Color(0xff6b6b6b),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AccountPage(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

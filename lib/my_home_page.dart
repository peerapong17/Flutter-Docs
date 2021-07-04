import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_docs/container_page.dart';
import 'package:flutter_docs/section_card.dart';

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
              SectionCard(text: "Container"),
              SectionCard(
                text: "Drawer",
                color: Color(0xffffcf94),
              ),
              SectionCard(
                text: "Router",
                color: Color(0xffe196ff),
              ),
              SectionCard(
                text: "Button",
                color: Color(0xff9dff94),
              ),
              SectionCard(
                text: "Form",
                color: Color(0xffffcf94),
              ),
              SectionCard(text: "API"),
            ],
          ),
        ],
      ),
    );
  }
}

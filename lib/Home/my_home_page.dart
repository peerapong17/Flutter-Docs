import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/section_card.dart';
import 'model/all_sections.dart';

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
            children: List.generate(
              sections.length,
              (index) {
                return SectionCard(
                    color: sections[index].color,
                    name: sections[index].name,
                    page: sections[index].page);
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      // body: ListView(
      //   children: [
      //     Column(
      //       crossAxisAlignment: CrossAxisAlignment.stretch,
      //       children: sections
      //           .map(
      //             (e) => SectionCard(
      //                 color: e.color, name: e.name, routeName: e.routeName),
      //           )
      //           .toList(),
      //     ),
      //   ],
      // ),
      body: GridView.count(
        padding: EdgeInsets.all(10),
        childAspectRatio: 2,
        crossAxisCount: 2,
        children: sections.map(
          (section) {
            return GestureDetector(
              onTap: () => Navigator.pushNamed(context, section.routeName),
              child: Card(
                color: section.color,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      section.name,
                      style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}

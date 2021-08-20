import 'package:flutter/material.dart';

class FutureBuilderPage extends StatefulWidget {
  const FutureBuilderPage({Key? key}) : super(key: key);

  @override
  _FutureBuilderPageState createState() => _FutureBuilderPageState();
}

class _FutureBuilderPageState extends State<FutureBuilderPage> {
  Future<String> delayTime() async {
    await Future.delayed(const Duration(milliseconds: 9000), () {
      print("inside future delay");
    });
    print("outside Future delay");
    return "finished";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FutureBuilderSection"),
        centerTitle: true,
      ),
      body: FutureBuilder<String>(
          future: delayTime(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Center(
              child: Text("Time is up"),
            );
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            delayTime();
            setState(() {});
          },
          child: Icon(Icons.plus_one)),
    );
  }
}
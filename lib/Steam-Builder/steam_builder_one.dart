import 'package:flutter/material.dart';
import 'dart:async';

class SteamBuilderOne extends StatefulWidget {
  const SteamBuilderOne({Key? key}) : super(key: key);

  @override
  _SteamBuilderOneState createState() => _SteamBuilderOneState();
}

class _SteamBuilderOneState extends State<SteamBuilderOne> {
  int _counter = 0;
  StreamController<int> controller = new StreamController<int>();

  @override
  void initState() {
    super.initState();
    controller.add(_counter);
  }

  @override
  void dispose() {
    super.dispose();
    controller.close();
  }

  void _incrementCounter() {
    controller.sink.add(++_counter);
  }

  @override
  Widget build(BuildContext context) {
    print('render - scaffold');
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.plus_one),
        onPressed: _incrementCounter,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            StreamBuilder(
              stream: controller.stream,
              builder: (context, snapshot) {
                print('render - Counter Widget');
                return Expanded(
                  child: Container(
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        snapshot.data.toString(),
                        style: TextStyle(
                            fontSize: 120, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
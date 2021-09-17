import 'package:flutter/material.dart';
import 'dart:async';

class SteamBuilderTwo extends StatefulWidget {
  @override
  _SteamBuilderTwoState createState() => _SteamBuilderTwoState();
}

class _SteamBuilderTwoState extends State<SteamBuilderTwo> {
  bool _running = true;

  int _counter = 0;
  Stream<int> _clock() async* {
    while (_running) {
      await Future<void>.delayed(Duration(seconds: 1));
      _counter++;
      yield _counter;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder<int>(
          stream: _clock(),
          builder: (context, AsyncSnapshot<int> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            return Text(
              snapshot.data.toString(),
              style: TextStyle(fontSize: 50, color: Colors.blue),
            );
          },
        ),
      ),
    );
  }
}

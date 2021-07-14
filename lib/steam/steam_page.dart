import 'package:flutter/material.dart';
import 'package:flutter_docs/steam/steam_builder_page.dart';

class SteamPage extends StatelessWidget {
  const SteamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Steam Section'),
      ),
      body: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SteamBuilderPage(),
            ),
          );
        },
        child: Text('Go to steambuilder'),
      ),
    );
  }
}

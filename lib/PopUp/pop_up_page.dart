import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Model/alert_dialog.dart';
import 'Model/prompt_dialog.dart';

class PopUpPage extends StatefulWidget {
  const PopUpPage({Key? key}) : super(key: key);

  @override
  _PopUpPageState createState() => _PopUpPageState();
}

class _PopUpPageState extends State<PopUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pop Up'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        width: double.infinity,
        child: Column(
          children: [
            ElevatedButton(
              child: Text('Show SnackBar'),
              onPressed: _showSnackBar,
            ),
            ElevatedButton(
              child: Text('Show Material Dialog'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return showMaterialDialog(context);
                  },
                );
              },
            ),
            ElevatedButton(
              child: Text('Show Prompt Dialog'),
              onPressed: (){
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return showPromtDialog(context);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  _showSnackBar() {
    final snackBar = SnackBar(
      content: Text('Yay! This Is A SnackBar!'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
    // Find the ScaffoldMessenger in the widget tree
    // and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

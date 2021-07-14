import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              onPressed: _showMaterialDialog,
            ),
            ElevatedButton(
              child: Text('Show Cupertino Dialog'),
              onPressed: _showCupertinoDialog,
            ),
            ElevatedButton(
              child: Text('Show Prompt Dialog'),
              onPressed: _showPromtDialog,
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

  _showMaterialDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("AlertDialog"),
          content: Text(
              "Would you like to continue learning how to use Flutter alerts?"),
          actions: [
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Continue"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _showCupertinoDialog() {
    showDialog(
      context: context,
      builder: (_) => new CupertinoAlertDialog(
        title: new Text("Cupertino Dialog"),
        content: new Text("Hey! I'm Coflutter!"),
        actions: <Widget>[
          TextButton(
            child: Text('Close me!'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

  _showPromtDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('What is your Lucky Number'),
          content: TextField(
            textInputAction: TextInputAction.go,
            keyboardType: TextInputType.numberWithOptions(),
            decoration: InputDecoration(hintText: "Enter your number"),
          ),
          actions: <Widget>[
            new TextButton(
              child: new Text('Submit'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
}

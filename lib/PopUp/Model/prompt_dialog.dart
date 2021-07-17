import 'package:flutter/material.dart';

showPromtDialog(BuildContext context) {
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
}

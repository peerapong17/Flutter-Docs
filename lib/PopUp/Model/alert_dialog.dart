import 'package:flutter/material.dart';

showMaterialDialog(BuildContext context) {
  return AlertDialog(
    title: Text("AlertDialog"),
    content:
        Text("Would you like to continue learning how to use Flutter alerts?"),
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
}

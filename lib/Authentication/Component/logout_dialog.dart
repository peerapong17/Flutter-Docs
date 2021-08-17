import 'package:flutter/material.dart';
import 'package:flutter_docs/Authentication/Services/auth.dart';
import 'package:flutter_docs/Authentication/account_page.dart';

import '../todo_page.dart';

Future<dynamic> logoutDialog(BuildContext context, Auth auth) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text("Are you sure?"),
      content: Text('You will be directed to login screen'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () => auth.logout().then(
            (value) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AccountPage();
                  },
                ),
                (route) => false,
              );
            },
          ),
          child: Text('OK'),
        ),
      ],
    ),
  );
}

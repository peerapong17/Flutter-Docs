import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_docs/Authentication/Model/toast.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../account_page.dart';

FirebaseAuth auth = FirebaseAuth.instance;

AlertDialog alertDialogLogout(BuildContext context, FToast? fToast,
    String title, String content, Function action) {
  return AlertDialog(
    title: Text(title),
    content:
        Text(content),
    actions: [
      TextButton(
        child: Text("Cancel"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.red.shade700,
          textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        child: Text("OK"),
        onPressed: () {
          action();
        },
      ),
    ],
  );
}

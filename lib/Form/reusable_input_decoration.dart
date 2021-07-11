import 'package:flutter/material.dart';

InputDecoration reusableInputDecoration(String? inputType, IconData? icon) {
    return InputDecoration(
      labelStyle: TextStyle(fontSize: 20),
      labelText: inputType,
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red.shade300, width: 2.0),
        borderRadius: BorderRadius.all(
          Radius.circular(7.0),
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red.shade300, width: 2.0),
        borderRadius: BorderRadius.all(
          Radius.circular(7.0),
        ),
      ),
      prefixIcon: Icon(icon),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.greenAccent, width: 2.0),
          borderRadius: BorderRadius.all(
            Radius.circular(7.0),
          )),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black26, width: 2.0),
          borderRadius: BorderRadius.all(
            Radius.circular(7.0),
          )),
    );
  }

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

SnackBar snackBar(FirebaseException e) {
  return SnackBar(
    action: SnackBarAction(
      label: 'OK',
      onPressed: () {},
    ),
    content: Text(e.message ?? "Something went wrong"),
    duration: const Duration(milliseconds: 3000),
    padding: const EdgeInsets.symmetric(
      horizontal: 8.0, // Inner padding for SnackBar content.
    ),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(7.0),
    ),
  );
}

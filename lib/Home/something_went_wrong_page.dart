import 'package:flutter/material.dart';

class SomethingWentWrongPage extends StatelessWidget {
  const SomethingWentWrongPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Something Went Wrong!",
        style: TextStyle(fontSize: 120, fontWeight: FontWeight.w800),
      ),
    );
  }
}

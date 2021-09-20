import 'package:flutter/material.dart';

class SectionCard extends StatelessWidget {
  SectionCard(
      {Key? key, required this.color, required this.name, required this.routeName});

  final String name;
  final Color color;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.black12),
        ),
      ),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // <-- Radius
              ),
              elevation: 10,
              primary: color,
              padding: EdgeInsets.all(17),
              textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            onPressed: () => Navigator.pushNamed(context, routeName),
            child: Row(
              children: [
                Text(
                  name,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Icon(Icons.arrow_forward_ios),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SectionCard extends StatelessWidget {
  SectionCard({Key? key, this.color, required this.text, this.onTap})
      : super(key: key);

  final String text;
  final Color? color;
  final Future<dynamic> Function()? onTap;

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
              primary: color != null ? color : Color(0xff7d8be3),
              padding: EdgeInsets.all(17),
              textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            onPressed: onTap,
            child: Row(
              children: [
                Text(
                  text,
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

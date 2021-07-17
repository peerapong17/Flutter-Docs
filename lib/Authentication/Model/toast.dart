import 'package:flutter/material.dart';

Widget toast(String message, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: color,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          SizedBox(
            width: 12.0,
          ),
          Text(
            message,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
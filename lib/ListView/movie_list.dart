import 'package:flutter/material.dart';

Container movieList(String name, String type, String image) {
    return Container(
      margin: EdgeInsets.all(7),
      decoration: BoxDecoration(
          color: Colors.pink.shade100, borderRadius: BorderRadius.circular(7)),
      child: ListTile(
        tileColor: Colors.pink.shade100,
        title: Text(name),
        subtitle: Text(type),
        leading: Image(
          image: AssetImage(image),
          height: 200,
        ),
        trailing: Icon(Icons.arrow_forward_ios_outlined),
      ),
    );
  }
import 'package:flutter/material.dart';

Container topMovies(String movieImage) {
    return Container(
      margin: EdgeInsets.all(7),
      child: Column(
        children: [
          Image(
            image: AssetImage(movieImage),
            height: 150,
          )
        ],
      ),
    );
  }
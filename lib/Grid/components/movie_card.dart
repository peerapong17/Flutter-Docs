import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../movie_detail_page.dart';

Card movieCard(String image, String name, BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      clipBehavior: Clip.antiAlias,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.0),
      ),
      child: Ink.image(
        image: AssetImage(image),
        fit: BoxFit.fill,
        child: InkWell(
          splashColor: Colors.white.withOpacity(0.2),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (builder) => MovieDetailPage(
                  image: image,
                  name: name,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
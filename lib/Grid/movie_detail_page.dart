import 'package:flutter/material.dart';

class MovieDetailPage extends StatelessWidget {
  final String? image;
  final String? name;
  const MovieDetailPage({Key? key, this.image, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Detail'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Image(
          fit: BoxFit.cover,
          image: AssetImage(image!),
        ),
      ),
    );
  }
}

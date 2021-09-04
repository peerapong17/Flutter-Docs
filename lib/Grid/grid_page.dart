import 'package:flutter/material.dart';
import '../Model/Movies.dart';
import 'components/movie_card.dart';
import 'movie_detail_page.dart';

class GridPage extends StatefulWidget {
  const GridPage({Key? key}) : super(key: key);

  @override
  _GridPageState createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid'),
        centerTitle: true,
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(10),
        childAspectRatio: 0.7,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        // children: [
        //   ...movieList.map(
        //     (movie) {
        //       return movieCard(movie['image'], movie['name']);
        //     },
        //   ),
        // ],
        children: List.generate(
          movies.length,
          (index) {
            return movieCard(
                movies[index]['image'], movies[index]['name'], context);
          },
        ),
      ),
    );
  }
}

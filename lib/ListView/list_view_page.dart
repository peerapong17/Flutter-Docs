import 'package:flutter/material.dart';
import 'package:flutter_docs/ListView/models/movie_types.dart';
import '../Model/Movies.dart';
import 'components/movie_tile.dart';
import 'components/movie_type_list.dart';
import 'components/top_movies.dart';
import './models/movie_types.dart';

class ListViewPage extends StatelessWidget {
  static const routeName = 'ListView';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                color: Colors.white,
                height: height * 0.15,
                width: double.infinity,
                child: ListView(
                  padding: EdgeInsets.all(10),
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    movieTypes.length,
                    (index) {
                      return movieTypeList(movieTypes[index]);
                    },
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                height: height * 0.45,
                width: double.infinity,
                child: ListView.builder(
                  padding: EdgeInsets.all(10),
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    return topMovies(movies[index]['image']!);
                  },
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    ...movies.map(
                      (movie) {
                        return movieList(
                            movie['name']!, movie['type']!, movie['image']!);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

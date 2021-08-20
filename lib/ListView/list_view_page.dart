import 'package:flutter/material.dart';
import 'package:flutter_docs/ListView/top_movies.dart';
import '../Model/Movies.dart';
import 'movie_list.dart';
import 'movie_types.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({Key? key}) : super(key: key);

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
                  children: [
                    movieTypes('Action'),
                    movieTypes('Adventure'),
                    movieTypes('Romance'),
                    movieTypes('Sci-Fi'),
                    movieTypes('Horror'),
                    movieTypes('Fantasy'),
                    movieTypes('Comedy'),
                    movieTypes('Thriller'),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                height: height * 0.45,
                width: double.infinity,
                child: ListView(
                  padding: EdgeInsets.all(10),
                  scrollDirection: Axis.horizontal,
                  children: [
                    ...movieList.map(
                      (movie) {
                        return topMovies(movie['image']!);
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    ...movieList.map(
                      (movie) {
                        return movieTile(
                            movie['name']!, movie['type']!, movie['image']!);
                      },
                    ).toList(),
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

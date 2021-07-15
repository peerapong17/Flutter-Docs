import 'package:flutter/material.dart';
import '../Model/Movies.dart';
import 'movie_detail_page.dart';

class GridPage extends StatefulWidget {
  const GridPage({Key? key}) : super(key: key);

  @override
  _GridPageState createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {
  // listMovie() {
  //   print(movieList.map((e) => {

  //   }));
  // }

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
        children: [
          ...movieList.map(
            (movie) {
              return movieCard(movie['image'], movie['name']);
            },
          ),
        ],
      ),
    );
  }

  Card movieCard(String? image, String? name) {
    return Card(
      shadowColor: Colors.black,
      clipBehavior: Clip.antiAlias,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.0),
      ),
      child: Ink.image(
        image: AssetImage(image!),
        fit: BoxFit.fill,
        child: InkWell(
          splashColor: Colors.white.withOpacity(0.2),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (builder) => MovieDetailPage(image: image,name: name,),
              ),
            );
          },
        ),
      ),
    );
  }
}

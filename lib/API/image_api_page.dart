import 'package:flutter/material.dart';
import 'package:flutter_docs/Model/user_model.dart';
import './services/fetch_data.dart';

class ImageApiPage extends StatefulWidget {
  const ImageApiPage({Key? key}) : super(key: key);

  @override
  _ImageApiPageState createState() => _ImageApiPageState();
}

class _ImageApiPageState extends State<ImageApiPage> {
  List<UserModel> images = [];
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  images[index].title!,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                Image.network(images[index].url!)
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          count++;
          UserModel data = await fetchData(count);
          images.add(data);
          setState(() {});
        },
      ),
    );
  }
}

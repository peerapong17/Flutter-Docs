import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_docs/model/user_model.dart';
import 'package:flutter_docs/model/user_model.dart';
import 'package:flutter_docs/my_home_page.dart';
import 'package:http/http.dart' as http;

class ApiPage extends StatefulWidget {
  const ApiPage({Key? key}) : super(key: key);

  @override
  _ApiPageState createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  List<UserModel> images = [];
  int count = 0;
  fetchUser() async {
    count++;
    var response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos/$count'));
    var decodedJson = json.decode(response.body);
    var userModel = UserModel.fromJson(decodedJson);
    setState(() {
      images.add(userModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'API section',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Color(0xffe196ff),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyHomePage(),
            ),
          ),
        ),
      ),
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
                SizedBox(height: 20,),
                Image.network(images[index].url!)
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: fetchUser,
      ),
    );
  }
}

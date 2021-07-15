import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_docs/Model/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherApiPage extends StatefulWidget {
  const WeatherApiPage({Key? key}) : super(key: key);

  @override
  _WeatherApiPageState createState() => _WeatherApiPageState();
}

class _WeatherApiPageState extends State<WeatherApiPage> {
  final inputController = TextEditingController();
  final API_KEY = "ca0873a42d04802307eab7bfa6d10f75";
  final MAIN_URL = "https://api.openweathermap.org/data/2.5/weather";
  List<WeatherModel> weatherData = [];
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    inputController.dispose();
    super.dispose();
  }

  fetchData(String input) async {
    weatherData = [];
    var response = await http
        .get(Uri.parse('$MAIN_URL?q=$input&appid=$API_KEY&units=metric'));
    var decodedJson = json.decode(response.body);
    print(decodedJson);
    WeatherModel weatherModel = WeatherModel.fromJson(decodedJson);
    setState(() {
      weatherData.add(weatherModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          children: [
            TextField(
              onChanged: (value) {
                if (value.isEmpty) {
                  setState(() {
                    weatherData = [];
                  });
                }
              },
              controller: inputController,
              keyboardType: TextInputType.text,
              style: TextStyle(fontSize: 25),
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                suffixIcon: IconButton(
                  iconSize: 35,
                  onPressed: () {
                    fetchData(inputController.text);
                  },
                  icon: Icon(Icons.search),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.greenAccent, width: 2.0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(7.0),
                    )),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26, width: 2.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(7.0),
                  ),
                ),
              ),
            ),
            weatherData.isEmpty
                ? SizedBox(
                    height: 180,
                  )
                : SizedBox(
                    height: 40,
                  ),
            weatherData.isEmpty
                ? Center(
                    child: Text(
                      'How Are You Today?',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent.shade100.withAlpha(80),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: InkWell(
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      splashColor: Colors.pinkAccent.shade100.withAlpha(80),
                      onTap: () {},
                      child: Column(
                        children: [
                          Spacer(),
                          ...weatherData.map(
                            (e) {
                              return Text(
                                e.main.temp.toString() + " C",
                                style: TextStyle(
                                    fontSize: 70, fontWeight: FontWeight.w600),
                              );
                            },
                          ),
                          SizedBox(
                            height: 70,
                          ),
                          ...weatherData.map(
                            (e) {
                              return Text(
                                e.name,
                                style: TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.w500),
                              );
                            },
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

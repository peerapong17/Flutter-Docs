import 'package:flutter/material.dart';

class GetStartedPage extends StatelessWidget {
  static const routeName = 'GetStarted';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Get Started",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "To create project, Use this command",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xfffcd4ff),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "flutter create your-project-name",
                    style: TextStyle(letterSpacing: 1),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Or open IDE press ctl + shift + p and type ",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 17),
                    ),
                    Text(
                      "Flutter",
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text("create folder and open it",
                    textAlign: TextAlign.start, style: TextStyle(fontSize: 17))
              ],
            )
          ],
        ),
      ),
    );
  }
}

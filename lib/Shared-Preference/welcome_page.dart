import 'package:flutter/material.dart';
import 'package:flutter_docs/Shared-Preference/shared_preference_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  String username = '';

  Future<void> _checkUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('username') != null &&
        prefs.getString('username')!.isNotEmpty) {
      setState(() {
        username = prefs.getString('username')!;
      });
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (builder) => SharedPreferencePage(),
          ),
          (route) => false);
    }
  }

  Future<void> _logoutUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (builder) => SharedPreferencePage(),
        ),
        (route) => false);
  }

  @override
  void initState() {
    super.initState();
    _checkUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome!"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              await _logoutUser();
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: Text(
        username,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 50),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_docs/Shared-Preference/welcome_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencePage extends StatefulWidget {
  static const routeName = "SharedPreference";

  @override
  _SharedPrefernceState createState() => _SharedPrefernceState();
}

class _SharedPrefernceState extends State<SharedPreferencePage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String username = '';
  String password = '';

  Future<void> _loginUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (builder) => WelcomePage(),
      ),
    );
  }

  Future<void> _checkUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('username') != null &&
        prefs.getString('username')!.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (builder) => WelcomePage(),
        ),
      );
    }
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
        title: Text("Shared Preference Section"),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        label: Text("Username"),
                        prefixIcon: Icon(Icons.person)),
                    validator: (String? value) {
                      if (value!.trim() == '' && value.trim().isEmpty) {
                        return "Username is required";
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      username = value!;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        label: Text("Password"),
                        prefixIcon: Icon(Icons.vpn_key)),
                    validator: (String? value) {
                      if (value!.trim() == '' && value.trim().isEmpty) {
                        return "Password is required";
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      password = value!;
                    },
                  ),
                  ElevatedButton(
                    child: Text("Login"),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        _formKey.currentState!.reset();
                        await _loginUser();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

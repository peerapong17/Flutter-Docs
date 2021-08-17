import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_docs/Authentication/register_page.dart';
import 'package:flutter_docs/Authentication/login_page.dart';
import 'package:flutter_docs/Authentication/todo_page.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

FirebaseAuth firebaseAuth = FirebaseAuth.instance;

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    if (firebaseAuth.currentUser != null) {
      return TodoPage();
    } else {
      return Scaffold(
        body: Center(
          child: Container(
            color: Colors.white70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginPage();
                        },
                      ),
                    );
                  },
                  child: Text('Login'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return RegisterPage();
                        },
                      ),
                    );
                  },
                  child: Text('Register'),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}

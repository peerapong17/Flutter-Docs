import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_docs/Home/my_home_page.dart';
import 'package:flutter_docs/Mixins/validation_mixin.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with ValidationMixin {
  FToast? fToast;
  FirebaseAuth auth = FirebaseAuth.instance;

  void initState() {
    super.initState();
    fToast = FToast();
    fToast!.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            "Welcome ${auth.currentUser?.email ?? "das"}",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.w700),
          ),
          ElevatedButton(
            onPressed: () {
              auth.signOut().then(
                (data) {
                  fToast!.showToast(
                    child: toast(
                        "Logged out Succesfully",
                        Colors.greenAccent.shade200.withOpacity(0.8),
                        Icons.check),
                    gravity: ToastGravity.BOTTOM,
                    toastDuration: Duration(seconds: 2),
                  );
                  return Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MyHomePage();
                      },
                    ),
                  );
                },
              );
            },
            child: Text("Logout"),
          ),
        ],
      ),
    );
  }
}

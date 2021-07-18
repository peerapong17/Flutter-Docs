import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_docs/Authentication/account_page.dart';
import 'package:flutter_docs/Authentication/todo_screen.dart';
import 'package:flutter_docs/Mixins/validation_mixin.dart';
import 'package:flutter_docs/steam/steam_builder_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Model/alert_dialog.dart';
import 'Model/toast.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with ValidationMixin {
  FToast? fToast;
  TextEditingController todoInput = TextEditingController();

  CollectionReference _todoCollection =
      FirebaseFirestore.instance.collection("todo");

  void initState() {
    super.initState();
    fToast = FToast();
    fToast!.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WELCOME'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return alertDialogLogout(
                        context,
                        fToast,
                        "Would You Like To Sign Out?",
                        "Thank You For Using Our Application", () {
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
                                return AccountPage();
                              },
                            ),
                          );
                        },
                      );
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("todo").snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  print(
                      "This is a documentID ${snapshot.data!.docs[index].id.characters}");
                  print(
                      "This is a Data ${snapshot.data!.docs[index].get("Todo")}");
                  print(
                      "This is a another way of getting all data ${snapshot.data!.docs[index].data()}");
                  print(
                      "This is a spicific data ${FirebaseFirestore.instance.collection("todo").doc("3U16Z65vysKkB6mDJqVI").get()}");
                  Map<String, dynamic> data =
                      snapshot.data!.docs[index].data() as Map<String, dynamic>;
                  // print(data);
                  return TodoScreen(
                    todoText: data['Todo'],
                    documentId:
                        snapshot.data!.docs[index].id.characters.toString(),
                  );
                });
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(auth.currentUser!.uid);
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('TODO'),
                content: TextField(
                  controller: todoInput,
                  autofocus: true,
                  textInputAction: TextInputAction.go,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "What would you like to do today?"),
                ),
                actions: <Widget>[
                  new TextButton(
                    child: new Text('Submit'),
                    onPressed: () async {
                      await _todoCollection.add(
                        {"Todo": todoInput.text.toUpperCase()},
                      );
                      todoInput.clear();
                      Navigator.pop(context);
                    },
                  )
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

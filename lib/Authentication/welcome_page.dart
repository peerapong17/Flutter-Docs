import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_docs/Authentication/account_page.dart';
import 'package:flutter_docs/Authentication/todo_screen.dart';
import 'package:flutter_docs/Mixins/validation_mixin.dart';
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
  FirebaseAuth user = FirebaseAuth.instance;

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
                        "Thank You For Using Our Application", () async {
                      await user.signOut().then(
                        (data) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return AccountPage();
                              },
                            ),
                          );
                          fToast!.showToast(
                            child: toast(
                                "Logged out Succesfully",
                                Colors.greenAccent.shade200.withOpacity(0.8),
                                Icons.check),
                            gravity: ToastGravity.BOTTOM,
                            toastDuration: Duration(seconds: 5),
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
          stream: _todoCollection
              .doc(user.currentUser!.uid)
              .collection('2')
              .snapshots(),
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
                      "This is all data ${snapshot.data!.docs[index].data()}");

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
                  onSubmitted: (String value) async {
                    Navigator.pop(context);
                    await _todoCollection
                        .doc(user.currentUser!.uid)
                        .collection('2')
                        .add(
                      {"Todo": value.toUpperCase()},
                    );
                    todoInput.clear();
                  },
                  controller: todoInput,
                  autofocus: true,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "What would you like to do today?"),
                ),
                actions: <Widget>[
                  new TextButton(
                    child: new Text('Submit'),
                    onPressed: () async {
                      Navigator.pop(context);
                      await _todoCollection
                          .doc(user.currentUser!.uid)
                          .collection('2')
                          .add(
                        {"Todo": todoInput.text.toUpperCase()},
                      );
                      todoInput.clear();
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

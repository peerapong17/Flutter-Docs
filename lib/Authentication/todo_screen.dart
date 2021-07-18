import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Model/alert_dialog.dart';
import 'Model/toast.dart';
import 'account_page.dart';

class TodoScreen extends StatefulWidget {
  final String todoText;
  final String documentId;
  const TodoScreen({Key? key, required this.todoText, required this.documentId})
      : super(key: key);

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  FToast? fToast;
  Future? todo;
  bool isEditing = false;
  TextEditingController todoInput = TextEditingController();
  FirebaseAuth user = FirebaseAuth.instance;
  CollectionReference _todoCollection =
      FirebaseFirestore.instance.collection("todo");

  Future<void> updateTodo() {
    return _todoCollection
        .doc(user.currentUser!.uid)
        .collection('2')
        .doc(widget.documentId)
        .update({'Todo': todoInput.text.toUpperCase()}).then((value) {
      print("Todo Updated");
    }).catchError((error) => print("Failed to update user: $error"));
  }

  Future<void> deleteTodo() {
    return _todoCollection
        .doc(user.currentUser!.uid)
        .collection('2')
        .doc(widget.documentId)
        .delete()
        .then((value) {
      print("Todo Deleted");
    }).catchError((error) => print("Failed to delete user: $error"));
  }

  void initState() {
    super.initState();
    fToast = FToast();
    fToast!.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 90,
            child: Card(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
              ),
              clipBehavior: Clip.antiAlias,
              color: Colors.amberAccent.shade400,
              child: InkWell(
                onTap: () {},
                splashColor: Colors.amberAccent,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 25, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      isEditing
                          ? Container(
                              width: 250,
                              child: TextField(
                                onSubmitted: (String value) async {
                                  setState(() {
                                    isEditing = !isEditing;
                                  });
                                  setState(() {
                                    todoInput.text = value;
                                  });
                                  await updateTodo();
                                },
                                controller: todoInput,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          : Text(
                              widget.todoText,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                      Row(
                        children: [
                          isEditing
                              ? IconButton(
                                  splashColor: Colors.pink.shade200,
                                  tooltip: "Edit",
                                  onPressed: () async {
                                    setState(() {
                                      isEditing = !isEditing;
                                    });
                                    await updateTodo();
                                  },
                                  icon: Icon(Icons.edit),
                                )
                              : IconButton(
                                  splashColor: Colors.pink.shade200,
                                  tooltip: "Edit",
                                  onPressed: () async {
                                    setState(() {
                                      isEditing = !isEditing;
                                    });
                                    setState(() {
                                      todoInput.text = widget.todoText;
                                    });
                                  },
                                  icon: Icon(Icons.edit),
                                ),
                          IconButton(
                            splashColor: Colors.pink.shade200,
                            tooltip: "Delete",
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return alertDialogLogout(
                                      context,
                                      fToast,
                                      "Are you sure?",
                                      "This todo will be deleted", () {
                                    deleteTodo();
                                    Navigator.of(context).pop();
                                  });
                                },
                              );
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              elevation: 7,
            ),
          ),
        ],
      ),
    );
  }
}

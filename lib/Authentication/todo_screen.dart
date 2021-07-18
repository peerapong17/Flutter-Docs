import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  final String todoText;
  final String documentId;
  const TodoScreen({Key? key, required this.todoText, required this.documentId})
      : super(key: key);

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  Future? todo;
  bool isEditing = false;
  TextEditingController todoInput = TextEditingController();

  Future<void> updateTodo() {
    return FirebaseFirestore.instance
        .collection('todo')
        .doc(widget.documentId)
        .update({'Todo': todoInput.text.toUpperCase()})
        .then((value) => print("Todo Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future<void> deleteTodo() {
    return FirebaseFirestore.instance
        .collection('todo')
        .doc(widget.documentId)
        .delete()
        .then((value) => print("Todo Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }

  Future queryOneTodo() {
    return FirebaseFirestore.instance
        .collection('todo')
        .doc(widget.documentId)
        .get();
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
                                    // var data =await queryOneTodo();
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
                              deleteTodo();
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

import 'package:flutter/material.dart';
import 'package:flutter_docs/Authentication/Services/auth.dart';
import 'package:flutter_docs/Authentication/Services/todo.dart';

Future<dynamic> addTodoDialog(BuildContext context,
    TextEditingController todoInput, Todo todo, Auth auth) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('TODO'),
        content: TextField(
          controller: todoInput,
          autofocus: true,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.text,
          decoration:
              InputDecoration(hintText: "What would you like to do today?"),
        ),
        actions: <Widget>[
          new TextButton(
            child: new Text('Submit'),
            onPressed: () async {
              todo.addTodo(todoInput.text, auth.uid);
              todoInput.clear();
              Navigator.pop(context);
            },
          )
        ],
      );
    },
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_docs/Authentication/Component/add_todo_dialog.dart';
import 'package:flutter_docs/Authentication/Component/logout_dialog.dart';
import 'package:flutter_docs/Authentication/todo_main.dart';
import 'package:flutter_docs/Mixins/validation_mixin.dart';
import 'Services/auth.dart';
import 'Services/todo.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> with ValidationMixin {
  TextEditingController todoInput = TextEditingController();
  Auth auth = new Auth();
  Todo todo = new Todo();

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
                logoutDialog(context, auth);
              },
            ),
          ),
        ],
      ),
      body: TodoMain(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          addTodoDialog(context, todoInput, todo, auth);
        },
      ),
    );
  }
}

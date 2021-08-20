import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_docs/Sqflite/Model/sqflite_helper.dart';

import 'Model/task_model.dart';

class TodoCard extends StatefulWidget {
  final String task;
  final int id;
  final Function refresh;
  TodoCard({
    Key? key,
    required this.task,
    required this.id,
    required this.refresh,
  }) : super(key: key);

  @override
  _TodoCardState createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  TextEditingController taskInput = TextEditingController();
  String task = '';
  TodoProvider todoProvider = TodoProvider();
  bool isEditting = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,
        height: 90,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isEditting
                    ? Container(
                        width: 250,
                        child: TextField(
                          onSubmitted: (String value) {
                            Todo taskModel = Todo.fromJson({
                              "id": widget.id,
                              "task": value == '' ? widget.task : value
                            });
                            todoProvider.updateTodo(taskModel);
                            widget.refresh();
                            setState(() {
                              isEditting = !isEditting;
                            });
                          },
                          controller: taskInput,
                          onChanged: (String value) {
                            task = value;
                          },
                        ),
                      )
                    : Text(
                        widget.task,
                        style: TextStyle(fontSize: 30),
                      ),
                Row(
                  children: [
                    isEditting
                        ? IconButton(
                            onPressed: () {
                              Todo taskModel = Todo.fromJson({
                                "id": widget.id,
                                "task": task == '' ? widget.task : task
                              });
                              todoProvider.updateTodo(taskModel);
                              widget.refresh();
                              setState(() {
                                isEditting = !isEditting;
                              });
                            },
                            icon: Icon(
                              Icons.update,
                              color: Colors.blue,
                            ),
                          )
                        : IconButton(
                            onPressed: () {
                              setState(
                                () {
                                  isEditting = !isEditting;
                                  taskInput.text = widget.task;
                                },
                              );
                            },
                            icon: Icon(Icons.edit),
                          ),
                    isEditting
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                isEditting = !isEditting;
                              });
                            },
                            icon: Icon(Icons.cancel),
                          )
                        : IconButton(
                            onPressed: () {
                              todoProvider.deleteTodo(widget.id);
                              widget.refresh();
                            },
                            icon: Icon(Icons.delete),
                          ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_docs/Sqflite/todo_card.dart';

import 'Model/sqflite_helper.dart';
import 'Model/task_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController taskInput = TextEditingController();
  TodoProvider todoProvider = TodoProvider();
  bool isEditting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sqflite Section'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: FutureBuilder(
                future: todoProvider.getTodos(),
                builder:
                    (BuildContext context, AsyncSnapshot<List<Todo>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount:
                          snapshot.data!.isNotEmpty ? snapshot.data!.length : 1,
                      itemBuilder: (BuildContext context, int index) {
                        Todo task = snapshot.data![index];
                        if (snapshot.data!.isNotEmpty) {
                          return TodoCard(
                            task: task.task!,
                            id: task.id!,
                            refresh: () {
                              setState(() {});
                            },
                          );
                        }
                        return Center(
                            child: Column(
                          children: [
                            Text('No Task...'),
                          ],
                        ));
                      },
                    );
                  }
                  if (snapshot.hasError) {
                    return Column(
                      children: [
                        Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text('Error: ${snapshot.error}'),
                        ),
                      ],
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            Container(
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: TextField(
                      controller: taskInput,
                      onSubmitted: (String value) async {
                        Todo taskModel = Todo.fromJson({"task": value});
                        await todoProvider.insert(taskModel);
                        taskInput.text = '';
                        FocusScope.of(context).unfocus();
                      },
                      decoration: InputDecoration(),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: IconButton(
                      onPressed: () async {
                        Todo taskModel =
                            Todo.fromJson({"task": taskInput.text});
                        await todoProvider.insert(taskModel);
                        taskInput.text = '';
                        FocusScope.of(context).unfocus();
                        setState(() {});
                      },
                      icon: Icon(Icons.send),
                    ),
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

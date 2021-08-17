import 'package:flutter/material.dart';
import 'Services/auth.dart';
import 'Services/todo.dart';

class TodoCard extends StatefulWidget {
  final String todoText;
  final String documentId;
  const TodoCard({Key? key, required this.todoText, required this.documentId})
      : super(key: key);

  @override
  _TodoCardState createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  bool isEditing = false;
  TextEditingController todoInput = TextEditingController();
  Auth auth = new Auth();
  Todo todo = new Todo();

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
              elevation: 7,
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
                                onSubmitted: (String value) {
                                  isEditing = !isEditing;
                                  todoInput.text = value;
                                  setState(() {});
                                  todo.updateTodo(
                                      widget.documentId, todoInput.text);
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
                                  onPressed: () {
                                    setState(() {
                                      isEditing = !isEditing;
                                    });
                                    todo.updateTodo(
                                        widget.documentId, todoInput.text);
                                  },
                                  icon: Icon(Icons.edit),
                                )
                              : IconButton(
                                  splashColor: Colors.pink.shade200,
                                  tooltip: "Edit",
                                  onPressed: () async {
                                    isEditing = !isEditing;
                                    todoInput.text = widget.todoText;
                                    setState(() {});
                                  },
                                  icon: Icon(Icons.edit),
                                ),
                          IconButton(
                            splashColor: Colors.pink.shade200,
                            tooltip: "Delete",
                            onPressed: () {
                              todo.deleteTodo(widget.documentId);
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
          ),
        ],
      ),
    );
  }
}

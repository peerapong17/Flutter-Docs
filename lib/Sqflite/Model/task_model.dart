// To parse this JSON data, do
//
//     final task = taskFromJson(jsonString);

import 'dart:convert';

Todo taskFromJson(String str) => Todo.fromJson(json.decode(str));

String taskToJson(Todo data) => json.encode(data.toJson());

class Todo {
  Todo({this.task, this.id});

  String? task;
  int? id;

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json["id"],
        task: json["task"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "task": task,
      };
}

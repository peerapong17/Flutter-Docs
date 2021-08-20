import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  CollectionReference todo = FirebaseFirestore.instance.collection("todo");

  Future addTodo(String value, String userId) {
    return todo
        .add({"task": value.toUpperCase(), "userId": userId})
        .then(
          (value) => print("Todo added"),
        )
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> updateTodo(String docId, String value) {
    return todo
        .doc(docId)
        .update({'task': value.toUpperCase()})
        .then((value) => print("Todo Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future<void> deleteTodo(String docId) {
    return todo
        .doc(docId)
        .delete()
        .then((value) => print("Todo Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }
}

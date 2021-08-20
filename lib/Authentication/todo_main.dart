import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_docs/Authentication/todo_card.dart';
import 'Services/todo.dart';

class TodoMain extends StatelessWidget {
  TodoMain({
    Key? key,
  }) : super(key: key);

  final Todo todo = new Todo();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: todo.todo.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData) {
          return Center(
            child: Text(
              "Nothing to do...",
              style: TextStyle(fontSize: 30),
            ),
          );
        }
        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            String docId = snapshot.data!.docs[index].id.characters.toString();
            print(
                "This is a documentID ${snapshot.data!.docs[index].id.characters}");
            print("This is all data ${snapshot.data!.docs[index].data()}");

            Map<String, dynamic> data =
                snapshot.data!.docs[index].data() as Map<String, dynamic>;
            print(snapshot.data!.docs[index].data());
            return TodoCard(
              todoText: data['task'] ?? "Do something...",
              documentId: docId,
            );
          },
        );
      },
    );
  }
}

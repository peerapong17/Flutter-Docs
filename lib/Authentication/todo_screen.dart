import 'package:flutter/material.dart';

class TodoScreen extends StatelessWidget {
  final String todoText;
  const TodoScreen({
    Key? key,
    required this.todoText,
  }) : super(key: key);

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
                      Text(
                        todoText,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {},
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

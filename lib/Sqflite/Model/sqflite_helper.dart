import 'package:flutter_docs/Sqflite/Model/task_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

final String tableTodo = 'todo';
final String columnId = 'id';
final String columnTitle = 'task';

class TodoProvider {
  Future<Database> initDatabase() async {
    return await openDatabase(join(await getDatabasesPath(), tableTodo),
        onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE $tableTodo ($columnId INTEGER PRIMARY KEY, $columnTitle TEXT)',
      );
    }, version: 1);
  }

  Future<int> insert(Todo todo) async {

    final db = await initDatabase();
    
    var id = await db.insert(
      tableTodo,
      todo.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id;
  }

  Future<List<Todo>> getTodos() async {

    final db = await initDatabase();

    final List<Map<String, dynamic>> maps = await db.query(tableTodo);
    return List.generate(maps.length, (i) {
      return Todo(id: maps[i]['id'], task: maps[i]['task']);
    });
  }

  Future<void> updateTodo(Todo todo) async {

    final db = await initDatabase();

    await db.update(
      tableTodo,
      todo.toJson(),
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }

  Future<void> deleteTodo(int id) async {
    final db = await initDatabase();
    await db.delete(
      tableTodo,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

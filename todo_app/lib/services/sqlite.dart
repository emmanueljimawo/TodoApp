import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';
import 'dart:async';

class SqliteDataBaseService {
  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'main.db'),
        onCreate: _onCreate, version: 1);
  }

  //SQL code to create the database table
  static Future _onCreate(db, version) async {
    await db.execute('''
      CREATE TABLE toDo(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,   
      isDone INTEGER   
      )
      ''');
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await SqliteDataBaseService.database();
    db.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await SqliteDataBaseService.database();
    return db.query(table);
  }

  static Future<void> delete(String table, int id) async {
    final db = await SqliteDataBaseService.database();
    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  static Future<void> update(String table, id, Map data) async {
    final db = await SqliteDataBaseService.database();
    db.update(table, data, where: "id = ?", whereArgs: [id]);
  }
}

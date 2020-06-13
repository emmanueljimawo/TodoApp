import 'package:todo_app/models/task_model.dart';
import 'package:flutter/foundation.dart';
import 'package:todo_app/services/sqlite.dart';

class TaskDataProvider extends ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks.reversed.toList();

  int get taskCount => _tasks.length;

  void addTask(instance) {
    //_tasks.add(instance);
    SqliteDataBaseService.insert('toDo', instance.toDatabaseJson());
    notifyListeners();
  }

  Future<void> fetchTasks() async {
    final dataList = await SqliteDataBaseService.getData('toDo');
    _tasks = dataList.map((item) => Task.fromDatabaseJson(item)).toList();
    notifyListeners();
  }

  Future<void> update(int id, Map item) async {
    SqliteDataBaseService.insert('toDo', {
      'id': id,
      'name': item['name'],
      'isDone': item['isDone'],
    });
    notifyListeners();
  }

  Future<void> delete(int id) async {
    SqliteDataBaseService.delete('toDo', id);
    notifyListeners();
  }

  void checkbox(Task task) {
    SqliteDataBaseService.insert('toDo', task.toDatabaseJson());
    notifyListeners();
  }
}

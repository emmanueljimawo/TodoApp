import 'dart:collection';
import 'package:todo_app/models/task.dart';
import 'package:flutter/foundation.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy Bread'),
    Task(name: 'Buy Milo')
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(value) {
    _tasks.add(Task(name: value));
    notifyListeners();
  }

  void checkbox(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void taskDelete(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
